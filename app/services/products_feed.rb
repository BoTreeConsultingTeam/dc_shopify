class ProductsFeed
  ShopifyAPI::Base.site = "https://#{ENV['SHOPIFY_API_KEY']}:#{ENV['SHOPIFY_API_PASSWORD']}@#{ENV['SHOP_NAME']}.myshopify.com/admin".freeze

  attr_reader :feed

  def initialize
    ShopifyAPI::Shop.current
  end

  def generate
    builder = Nokogiri::XML::Builder.new do |xml|
      xml.items {
        ShopifyAPI::Product.all.each do |product|
          variant = product.variants.first
          collection = product.collections.first

          xml.item {
            xml.sku variant.sku
            xml.product product.title
            xml.description product.body_html
            xml.brand product.vendor
            xml.first_category(url_value: "collections/#{collection.handle}") { xml.text collection.title }
            xml.price variant.price
            xml.stock_amount variant.inventory_quantity
            xml.stock_available variant.inventory_quantity == 0
            xml.image_url product.image.src
          }
        end
      }
    end

    @feed = builder.to_xml

    validator = XmlValidator.new(feed)
    raise InvalidFeedError, 'The generated feed does not follow Dynamic Creative Standards' unless validator.valid?

    feed
  end
end

class InvalidFeedError < StandardError; end

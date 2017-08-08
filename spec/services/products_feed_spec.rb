require 'rails_helper'

RSpec.describe ProductsFeed do
  describe '#generate' do
    let(:store_credential) do
      StoreCredential.new(api_key: ENV['SHOPIFY_API_KEY'],
                          api_password: ENV['SHOPIFY_API_PASSWORD'],
                          store_name: ENV['SHOP_NAME'])
    end
    it 'returns xml feed when valid' do
      # VCR.use_cassette 'products' do
      xml = ProductsFeed.new(store_credential).generate
      expect(xml).to eq(File.read(Rails.root.join('spec/fixtures/valid.xml')))
      # end
    end

    it 'raises error when valid' do
      # VCR.use_cassette 'products' do
      expect_any_instance_of(ProductsFeed).to receive(:feed).and_return(File.read(Rails.root.join('spec/fixtures/invalid.xml')))
      expect { ProductsFeed.new(store_credential).generate }.to raise_error InvalidFeedError
      # end
    end
  end
end

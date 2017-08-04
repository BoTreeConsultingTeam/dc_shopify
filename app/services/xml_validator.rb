class XmlValidator
  SCHEMA = Nokogiri::XML::Schema(File.read(Rails.public_path + 'retail_standard.xsd'))

  def initialize(xml_content, schema = SCHEMA)
    @schema = schema.presence || SCHEMA
    @xml_content = Nokogiri::XML(xml_content)
  end

  def valid?
    errors.none?
  end

  def errors
    @errors ||= @schema.validate(@xml_content)
  end
end

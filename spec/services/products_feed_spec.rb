require 'rails_helper'

RSpec.describe ProductsFeed do
  describe '#generate' do
    it 'returns xml feed when valid' do
      # VCR.use_cassette 'products' do
      xml = ProductsFeed.new.generate
      expect(xml).to eq(File.read(Rails.root.join('spec/fixtures/valid.xml')))
      # end
    end

    it 'raises error when valid' do
      # VCR.use_cassette 'products' do
      expect_any_instance_of(ProductsFeed).to receive(:feed).and_return(File.read(Rails.root.join('spec/fixtures/invalid.xml')))
      expect { ProductsFeed.new.generate }.to raise_error InvalidFeedError
      # end
    end
  end
end
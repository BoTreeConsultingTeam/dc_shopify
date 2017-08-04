require 'rails_helper'

RSpec.describe XmlValidator do
  describe '#valid?' do
    context 'when xml is invalid' do
      it 'returns false' do
        validator = XmlValidator.new(File.read(Rails.root.join('spec/fixtures/invalid.xml')))
        expect(validator).not_to be_valid
      end
    end

    context 'when xml is valid' do
      it 'returns true' do
        validator = XmlValidator.new(File.read(Rails.root.join('spec/fixtures/valid.xml')))
        expect(validator).to be_valid
      end
    end
  end
end
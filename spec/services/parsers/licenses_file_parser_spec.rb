# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Parsers::LicensesFileParser do
  let(:parsed_data) { [
    {
      :date_of_birth=>"1/18/1995",
      :email=>"joe.doe@test.com",
      :name=>"Joe Doe",
      :license_number=>"335345435"
    },
    {
      :date_of_birth=>"3/27/1994",
      :email=>"mark.bark@test.com",
      :name=>"Mark Bark",
      :license_number=>"234532453"
    },
    {
      :date_of_birth=>"9/12/1992",
      :email=>"tony.johnson@test.com",
      :name=>"Tony Johnson",
      :license_number=>"123234223"
    }
  ] }
  let(:file_path) { "#{Rails.root}/spec/files/licenses_data.csv" }

  describe '#parse!' do
    context 'when file is csv' do
      let(:file_type) { 'text/csv' }
      subject(:licenses_file_parser) { described_class.new(
        file_path: file_path,
        file_type: file_type
      ) }
  
      it 'returns an array of parsed license hashes' do
        expect(licenses_file_parser.parse!).to eq parsed_data
      end
    end

    context 'when file\'s type is not a supported type' do
      let(:file_type) { 'x' }
      subject(:licenses_file_parser) { described_class.new(
        file_path: file_path,
        file_type: file_type
      ) }
  
      it 'return an error' do
        expect { licenses_file_parser.parse! }.to raise_error(
          Parsers::LicensesFileParser::FileTypeNotSupported,
          "File type is not supported"
        )
      end
    end
  end
end

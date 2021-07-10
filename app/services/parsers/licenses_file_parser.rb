# frozen_string_literal: true

module Parsers
  class LicensesFileParser
    class FileTypeNotSupported < StandardError; end

    include Parsers::Interface

    def initialize(file_path:, file_type:)
      @file_path = file_path
      @file_type = file_type
    end

    def parse!
      case @file_type
      when 'text/csv'
        Parsers::CSV::Licenses.new(@file_path).parse!
      when 'json'
        # TODO: implement JSON parser
      when 'xml'
        # TODO: Implement XML parser
      else
        raise FileTypeNotSupported, 'File type is not supported'
      end
    end
  end
end

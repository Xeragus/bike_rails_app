# frozen_string_literal: true

module Parsers
  module CSV
    class Licenses
      include Parsers::Interface
  
      def initialize(file_path)
        @file_path = file_path
      end
  
      def parse!
        data = []
        
        # This is the fastest way to parse large CSV files I know
        # For CSV file with 1 million rows (~ 75 MB) it takes around 10 sec and 0.58 MB
        ::CSV.foreach(@file_path, headers: true) do |row|
          data << {
            license_number: row['license_number'],
            name: row['name'],
            email: row['email'],
            date_of_birth: row['date_of_birth']
          }
        end

        data
      end
    end
  end
end

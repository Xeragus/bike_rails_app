# frozen_string_literal: true

module Parsers
  module Interface
    def parse!
      raise "Parser interface method #{__method__} not implemented"
    end
  end
end

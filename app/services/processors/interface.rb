# frozen_string_literal: true

module Processors
  module Interface
    def process!
      raise "Processor interface method #{__method__} not implemented"
    end
  end
end

# frozen_string_literal: true

module Generators
  module Interface
    def generate!
      raise "Generator interface method #{__method__} not implemented"
    end
  end
end

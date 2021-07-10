# frozen_string_literal: true

module Processors
  class Licenses
    include Processors::Interface

    def process!(params:, user:)
      # TODO: Call job to proceed
      return :ok
    end
  end
end

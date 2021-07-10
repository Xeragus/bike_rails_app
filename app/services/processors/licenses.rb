# frozen_string_literal: true

module Processors
  class Licenses
    include Processors::Interface

    def process!(params:, user:)
      ParseLicensesJob.perform_later(
        file_path: params[:file].path,
        file_type: params[:file].content_type,
        user: user
      )
    end
  end
end

# frozen_string_literal: true

class ParseLicensesJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    ProcessLicensesJob.perform_later(data: @data, user: job.arguments.first[:user])
  end

  def perform(file_path:, file_type:, user:)
    @data = Parsers::LicensesFileParser.new(file_path: file_path, file_type: file_type).parse!
  end
end

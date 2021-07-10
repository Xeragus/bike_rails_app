# frozen_string_literal: true

class ProcessLicensesJob < ApplicationJob
  queue_as :default

  def perform(data:, user:)
    data.each do |license_data|
      license = License.create!(license_data)
      RiderMailer.with(license: license).mail_license.deliver_now
    end
  end
end

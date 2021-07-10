# frozen_string_literal: true

class ProcessLicensesJob < ApplicationJob
  queue_as :default

  after_perform do |job|
    PartnerMailer.with(user: job.arguments.first[:user])
                 .notify_licenses_processed
                 .deliver_later
    CompanyMailer.with(user: job.arguments.first[:user],
                       licenses_count: job.arguments.first[:data].count)
                 .notify_licenses_processed
                 .deliver_later
  end

  def perform(data:, user:)
    data.each do |license_data|
      license = License.create!(license_data)
      RiderMailer.with(license: license).mail_license.deliver_now
    end
  end
end

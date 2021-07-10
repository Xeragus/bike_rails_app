# frozen_string_literal: true

every 1.day, at: '7:00 am' do
  runner "CompanyMailer.nightly_activity_report.deliver_later"
end

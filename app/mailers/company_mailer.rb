# frozen_string_literal: true

class CompanyMailer < ApplicationMailer
  def notify_licenses_processed
    @user = params[:user]
    licenses_count = params[:licenses_count]
    @greeting = "Licenses report was submitted by #{@user.email}"
    @content = "#{licenses_count} licenses submitted, #{licenses_count} licenses processed"
  
    mail to: 'ba@test.com', subject: "Report on processed licenses submitted by #{@user.email}"
  end
end

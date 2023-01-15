# frozen_string_literal: true

class RiderMailer < ApplicationMailer
  def mail_license
    @license = params[:license]
    @greeting = "Hi #{@license.email}!"
    @content = 'Your license is ready. You can find it attached to this email.'

    pdf = Generators::PDF::License.new(@license).generate!
    attachments["license_#{@license.license_number}.pdf"] = pdf

    mail to: @license.email, subject: 'Your license is ready!'
  end
end

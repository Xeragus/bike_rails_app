# frozen_string_literal: true

class PartnerMailer < ApplicationMailer
  def notify_licenses_processed
    @user = params[:user]
    @greeting = "Hi #{@user.email}!"
    @content = "We would like to inform you that all licenses "\
               "you have submitted are processed and sent to riders."
  
    mail to: @user.email, subject: 'All licenses are processed and sent to riders!'
  end
end

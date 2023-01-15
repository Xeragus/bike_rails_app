# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RiderMailer, :type => :mailer do
  describe 'notify' do
    let(:license) { create(:license) }
    let(:mail) { RiderMailer.with(license: license).mail_license }

    it 'renders the headers' do
      expect(mail.subject).to eq('Your license is ready!')
      expect(mail.to).to eq([license.email])
      expect(mail.from).to eq(['bike.anonymous@example.com'])
    end
  end
end

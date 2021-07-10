require "rails_helper"

RSpec.describe CompanyMailer, type: :mailer do
  describe "notify_licenses_processed" do
    let(:user) { create(:user) }
    let(:license_count) { 5 }
    let(:mail) do
      CompanyMailer.with(user: user, license_count: license_count)
                   .notify_licenses_processed
    end

    it "renders the headers" do
      expect(mail.subject).to eq("Report on processed licenses submitted by #{user.email}")
      expect(mail.to).to eq(['ba@test.com'])
      expect(mail.from).to eq(["bike.anonymous@example.com"])
    end
  end
end

require "rails_helper"

RSpec.describe PartnerMailer, type: :mailer do
  describe "notify_licenses_processed" do
    let(:user) { create(:user) }
    let(:mail) { PartnerMailer.with(user: user).notify_licenses_processed }

    it "renders the headers" do
      expect(mail.subject).to eq("All licenses are processed and sent to riders!")
      expect(mail.to).to eq([user.email])
      expect(mail.from).to eq(["bike.anonymous@example.com"])
    end
  end
end

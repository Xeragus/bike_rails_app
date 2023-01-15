# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::LicensesController do
  let(:user) { create(:user) }
  let(:file_path) { "#{Rails.root}/spec/files/licenses_data.csv" }

  before { allow(controller).to receive(:logged_in_user).and_return(user) }

  describe '#submit' do
    let(:message) { 'Licenses are being processed. '\
                    'Once done, you will receive an e-mail confirmation.' }
    let(:file) { fixture_file_upload(file_path, 'text/csv') }

    it 'returns 200' do
      post :submit, params: { file: file }
      expect(response.status).to eq 200
      expect(JSON.parse(response.body)['message']).to eq message
    end
  end
end

# frozen_string_literal: true

require 'rails_helper'

RSpec.describe API::V1::LicensesController do
  let(:user) { create(:user) }

  before { allow(controller).to receive(:logged_in_user).and_return(user) }

  describe '#submit' do
    it 'returns 200' do
      post :submit
      expect(response.status).to eq 200
    end
  end
end

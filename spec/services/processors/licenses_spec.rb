# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Processors::Licenses do
  let(:user) { create(:user) }
  let(:file_path) { "#{Rails.root}/spec/files/licenses_data.csv" }
  let(:file) { fixture_file_upload(file_path, 'text/csv') }
  let(:params) { { file: file } }

  it 'returns :ok' do
    expect(ParseLicensesJob).to receive(:perform_later)
    described_class.new.process!(
      params: params,
      user: user
    )
  end
end

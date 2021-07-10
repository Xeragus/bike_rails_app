# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProcessLicensesJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }
  let(:file_path) { "#{Rails.root}/spec/files/licenses_data.csv" }
  let(:file_type) { 'text/csv' }
  let(:data) { Parsers::LicensesFileParser.new(file_path: file_path, file_type: file_type).parse! }
  let(:user) { create(:user) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in default queue' do
    expect(ProcessLicensesJob.new.queue_name).to eq('default')
  end

  it 'creates new licenses records' do
    expect do
      described_class.perform_now(data: data, user: user)
    end.to change(License, :count).by(3)
  end
end

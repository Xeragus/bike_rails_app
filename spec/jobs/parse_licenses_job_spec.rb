# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ParseLicensesJob, type: :job do
  include ActiveJob::TestHelper

  let(:file_path) { 'x' }
  let(:file_type) { 'y' }
  let(:user) { create(:user) }

  let(:file_parser) { instance_double Parsers::LicensesFileParser }

  before do
    allow(Parsers::LicensesFileParser).to receive(:new).with(
      file_path: file_path,
      file_type: file_type
    ).and_return(file_parser)
    allow(file_parser).to receive(:parse!).and_return([])
  end

  subject(:job) { described_class.perform_later(
    file_path: file_path,
    file_type: file_type,
    user: user
  ) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in default queue' do
    expect(ParseLicensesJob.new.queue_name).to eq('default')
  end

  it 'executes perform' do
    expect(Parsers::LicensesFileParser).to receive(:new).with(
      file_path: file_path,
      file_type: file_type
    )
    perform_enqueued_jobs { job }
  end
end

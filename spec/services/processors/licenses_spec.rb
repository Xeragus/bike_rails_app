# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Processors::Licenses do
  it 'returns :ok' do
    expect(described_class.new.process!(params: nil, user: nil)).to eq :ok
  end
end

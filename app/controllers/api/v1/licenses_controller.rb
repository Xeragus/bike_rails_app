# frozen_string_literal: true

class API::V1::LicensesController < ApplicationController
  def submit
    Processors::Licenses.new.process!(params: license_params, user: @user)

    render status: :ok
  end

  private

  def license_params
    params.permit(:file)
  end
end
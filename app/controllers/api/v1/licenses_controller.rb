# frozen_string_literal: true

class API::V1::LicensesController < ApplicationController
  def submit
    Processors::Licenses.new.process!(params: license_params, user: @user)

    render json: {
      message: "Licenses are being processed. "\
               "Once done, you will receive an e-mail confirmation."
    }
  end

  private

  def license_params
    params.permit(:file)
  end
end

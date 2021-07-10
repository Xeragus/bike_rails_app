# frozen_string_literal: true

class API::V1::AuthController < ApplicationController
  skip_before_action :authorize

  def register
    @user = User.create(auth_params)

    if @user.valid?
      token = encode_token({ user_id: @user.id, email: @user.email, expires_at: expires_at })

      render json: {user: @user, token: token }
    else
      render json: @user.errors.messages
    end
  end

  def login
    @user = User.find_by(email: auth_params[:email])

    if @user && @user.authenticate(auth_params[:password])
      token = encode_token({ user_id: @user.id, email: @user.email, expires_at: expires_at })

      render json: {user: @user, token: token }
    else
      render json: {error: 'Invalid email or password'}
    end
  end

  private

  def auth_params
    params.permit(
      :email, :password, :password_confirmation
    )
  end

  def expires_at
    Time.now.to_i + 4 * 3600
  end
end

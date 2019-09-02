# frozen_string_literal: true

class AuthenticationController < ApplicationController
  #  before_action :authenticate_request
  #  skip_before_action :authenticate_request

  def authenticate
    auth = AuthenticateUser.call(params[:email], params[:password])

    if auth.success?
      user = User.find_by(email: params[:email])
      render json: {
        auth_token: auth.result,
        user: user.as_json(except: %i[password_digest id role_id], include: :role)
      }
    else
      render json: { error: auth.errors }, status: :unauthorized
    end
  end
end

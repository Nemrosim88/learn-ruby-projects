# frozen_string_literal: true

require 'date'
class AuthenticationController < ApplicationController
  #  before_action :authenticate_request
  #  skip_before_action :authenticate_request

  def login
    client_ip = remote_ip
    access_token = AuthenticateUser.call(params[:email], params[:password])

    if access_token.success?
      user = User.find_by(email: params[:email])
      refresh_token = CreateRefreshToken.call(params[:email], params[:password])
      render json: {
        access_token: access_token.result,
        refresh_token: refresh_token.result,
        ip_address: client_ip,
        user: user.as_json(except: %i[password_digest id role_id], include: :role)
      }
    else
      render json: { error: access_token.errors }, status: :unauthorized
    end
  end

  # VERIFY TOKEN
  def verify
    result = JsonWebToken.verify(params[:token])
  rescue StandardError => e
    render json: { error: e }, status: :unauthorized
  else
    render json: {
      user_id: result[0]['user_id'],
      expire_date: DateTime.strptime(result[0]['exp'].to_s, '%s'),
      alg: result[1]['alg']
    }, status: :ok
  end

  # Refresh user's tokens (access_token and refresh_token)
  def refresh
    result = JsonWebToken.verify(params[:refresh_token])
  rescue StandardError => e
    render json: { error: e }, status: :unauthorized
  else
    render json: {
      access_token: JsonWebToken.encode_access_token(user_id: result[0]['user_id']),
      refresh_token: JsonWebToken.encode_refresh_token(user_id: result[0]['user_id'])
    }, status: :ok
  end
end

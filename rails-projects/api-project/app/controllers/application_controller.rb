# frozen_string_literal: true

class ApplicationController < ActionController::API
  # ADDED FOR JWT
  # before_action :authenticate_request
  attr_reader :current_user

  

  private

  def remote_ip
    if request.remote_ip == '127.0.0.1'
      # Hard coded remote address
      '123.45.67.89'
    else
      request.remote_ip
    end
  end

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end

  
end

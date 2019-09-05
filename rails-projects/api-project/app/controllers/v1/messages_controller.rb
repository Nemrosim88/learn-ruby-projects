# frozen_string_literal: true

class V1::MessagesController < ApplicationController

    before_action :authenticate_request

  def create
    @message = Message.new(message_params)
    @message.user = @current_user
    if @message.save
        # ActionCable.server.broadcast 'chatroom_channel'
      render json: @message, status: :created
    else
      render json: @message.errors, status: :bad_request
    end
  end

  private

  def message_params
    params.permit(:body)
  end
  
end

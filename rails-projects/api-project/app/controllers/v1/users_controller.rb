# frozen_string_literal: true

class V1::UsersController < ApplicationController

  before_action :authenticate_request, except: [:create]
  before_action :set_user, only: %i[show update destroy]

  def index
    @users = User.all
    render json: @users.as_json(except: [:password_digest]), status: :ok
  end

  def show
    render json: @user.as_json(except: [:password_digest]), status: :ok
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render json: @user, status: :created
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def update
    if @user.update(user_params)
      render status: :ok
    else
      render json: @user.errors, status: :bad_request
    end
  end

  def destroy
    if @user.destroy
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private

  def user_params
    params.permit(:name, :surname, :patronymic, :password, :nickname, :phone, :email)
  end

  def set_user
    @user = User.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :not_found
  end
end

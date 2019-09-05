# frozen_string_literal: true

class V1::UsersController < ApplicationController
  before_action :authenticate_request, except: [:create]
  before_action :set_user, only: %i[show update destroy]
  # before_action :set_default_role, only: [:create]

  def index
    @users = User.all
    render json: @users.as_json(except: [:password_digest]), status: :ok
  end

  def show
    render json: @user.as_json(except: [:password_digest], include: [:role]), status: :ok
  end

  def create
    @user = User.new(user_params)
    set_default_role
    if @user.save
      render json: @user.as_json(except: [:password_digest]), status: :created
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

  def set_default_role
    role_p = Role.find_by(alias: 'user')
    if role_p.present?
      @user.role = role_p
    else
      role_p = Role.create(name: 'user', alias: 'user')
      @user.role = role_p if role_p
    end
  end

  def user_params
    params.permit(:name, :surname, :patronymic, :password, :nickname, :phone, :email)
  end

  def set_user
    @user = User.find(params[:id])
    # if role was deleted from DB
    role =  Role.find_by(id: @user.role)
    if role.present?
      return user
    else
      role = Role.find_by(alias: 'user')
      if role.present?
        @user.role = role
        @user.save
      else
        role_p = Role.create(name: 'user', alias: 'user')
        @user.role = role_p if role_p
        @user.save
      end

      end
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :not_found
  end
end

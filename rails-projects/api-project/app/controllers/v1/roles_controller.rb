# frozen_string_literal: true

class V1::RolesController < ApplicationController

  # before_action :authenticate_request, except: [:create]
  before_action :find_role, only: %i[show update destroy]

  def index
    @roles = Role.all
    render json: @roles, status: :ok
  end

  def show
    render json: @role, status: :ok
  end

  def create
    @role = Role.new(roles_params)
    if @role.save
      render json: @role, status: :created
    else
      render json: @role.errors, status: :bad_request
    end
  end

  def update
    if @role.update(roles_params)
      render status: :ok
    else
      render json: @role.errors, status: :bad_request
    end
  end

  def destroy
    if @role.destroy
      render status: :ok
    else
      render status: :bad_request
    end
  end

  private

  def roles_params
    params.permit(:name, :alias)
  end

  def find_role
    @role = Role.find(params[:id])
  rescue ActiveRecord::RecordNotFound => e
    render json: { error: e }, status: :not_found
  end
  
end

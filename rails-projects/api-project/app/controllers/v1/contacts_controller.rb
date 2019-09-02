# frozen_string_literal: true

class V1::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    # RAILS STATUS CODES http://billpatrianakos.me/blog/2013/10/13/list-of-rails-status-code-symbols/
    # render json: @contacts, status: :ok
    # OR same line
    render json: { data: @contacts, status: 200 }
  end

  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      render json: @contact, status: :created
    else
      render json: @contact.errors, status: :bad_request

    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    if @contact.destroy
      head(:ok)
    else
      head(:unprocessable_entity)
    end
  end

  private

  def contact_params
    # puts "!!!!!!!!!!!!!!!!!!!!! #{params}"
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end

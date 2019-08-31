# frozen_string_literal: true

class V1::ContactsController < ApplicationController
  def index
    @contacts = Contact.all

    render json: @contacts, status: :ok
    # OR same line
    # render json: { data: @contacts, status: 200 }
  end

  def create
    @contact = Contact.new(contact_params)

    @contact.save

    render json: @contact, status: :created
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
    puts "!!!!!!!!!!!!!!!!!!!!! #{params}"
    params.require(:contact).permit(:first_name, :last_name, :email)
  end
end

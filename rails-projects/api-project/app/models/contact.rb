# frozen_string_literal: true

class Contact < ApplicationRecord
  belongs_to :user
  validates :user_id, presence: true
  validates :first_name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :last_name, presence: true, length: { minimum: 3, maximum: 15 }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

# frozen_string_literal: true

class Contact < ApplicationRecord
  # validations
  validates :first_name, presence: true, length: {
    minimum: 5,
    maximum: 10,
    too_short: 'The user name must have at least %{count} characters.',
    too_long: 'The user name must have no more than %{count} characters.'
  }
  validates :last_name, presence: true, length: {
    minimum: 5,
    maximum: 10,
    too_short: 'The user name must have at least %{count} characters.',
    too_long: 'The user name must have no more than %{count} characters.'
  }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
end

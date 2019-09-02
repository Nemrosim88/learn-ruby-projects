# frozen_string_literal: true

class User < ApplicationRecord
  
  has_many :contacts
  # Before saving convert email value to lowercase
  before_save { self.email = email.downcase }

  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :surname, presence: true, length: { minimum: 3, maximum: 15 }
  validates :patronymic, presence: true, length: { minimum: 3, maximum: 15 }
  validates :nickname,
            presence: true,
            # "joe" and "Joe" can be created.
            # uniqueness: true,
            # Solution:
            uniqueness: { case_sensitive: false },
            length: { minimum: 3, maximum: 15 }
  validates :phone, presence: true, length: { minimum: 3, maximum: 15 }
  # VALID_EMAIL_REGEXP = /\A.....some regexp...z\/i
  validates :email,
            presence: true,
            length: { minimum: 3, maximum: 105 },
            format: { with: URI::MailTo::EMAIL_REGEXP },
            # You can add custom regexp
            # format: { with: VALID_EMAIL_REGEXP },
            uniqueness: { case_sensitive: false }
  # Will automatically convert password to hash
  has_secure_password
end


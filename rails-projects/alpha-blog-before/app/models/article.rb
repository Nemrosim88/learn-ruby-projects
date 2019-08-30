# frozen_string_literal: true

# Rails will generate getters and setter for our columns in the table
# IF MAINTAIN EMPTY MODEL (no validations) - PROBLEM
# THEN ew could save to db object with all nil values
class Article < ApplicationRecord
  # Will not save data if title is "nil"
  validates :title, presense: true, length: { minimum: 3, maximum: 50 }
  validates :description, presense: true, length: { minimum: 10, maximum: 300 }
end

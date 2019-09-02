# frozen_string_literal: true

class Role < ApplicationRecord
  validates :name, presence: true, length: { minimum: 3, maximum: 25 }
  validates :alias, presence: true, length: { minimum: 3, maximum: 25 }
end

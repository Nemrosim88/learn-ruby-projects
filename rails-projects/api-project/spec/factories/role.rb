# frozen_string_literal: true

FactoryBot.define do
  factory :random_roles, class: Role do
    self.name { Faker::Name.first_name }
    self.alias { Faker::Name.last_name }
  end
end

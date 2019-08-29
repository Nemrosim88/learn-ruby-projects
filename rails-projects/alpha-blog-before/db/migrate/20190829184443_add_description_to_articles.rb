# frozen_string_literal: true

# Migration class for updating articles schema with new columns
class AddDescriptionToArticles < ActiveRecord::Migration[6.0]
  def change
    # add 'description' column with 'text' type
    # to 'articles' table
    # After creating this file run CLI rails db:migrate
    add_column :articles, :description, :text
    add_column :articles, :created_at, :datetime
    add_column :articles, :updated_at, :datetime
  end
end

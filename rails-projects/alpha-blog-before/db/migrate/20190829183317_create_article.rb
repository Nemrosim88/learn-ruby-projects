class CreateArticle < ActiveRecord::Migration[6.0]
  def change
    # We dont need to create id value
    # Rails will provide it for us
    create_table :articles do |t|
      t.string :title
    end
  end
end

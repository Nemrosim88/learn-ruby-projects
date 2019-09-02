class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :role_id, default: 0
      t.string :name
      t.string :surname
      t.string :patronymic
      t.string :nickname
      t.string :email
      t.string :phone
      t.string :password_digest
      t.timestamps
    end
  end
end

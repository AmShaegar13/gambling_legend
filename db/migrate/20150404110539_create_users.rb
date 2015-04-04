class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.integer :balance
      t.datetime :last_refill, null: false

      t.timestamps null: false
    end
    add_index :users, :name, unique: true
    add_index :users, :email, unique: true
  end
end

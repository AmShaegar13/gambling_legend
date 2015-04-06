class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id, null: false
      t.integer :type_id, null: false
      t.integer :choice_id, null: false
      t.integer :match_id
      t.integer :amount, null: false
      t.boolean :won

      t.timestamps null: false
    end
    add_index :bets, [:user_id, :type_id, :match_id], unique: true
  end
end

class CreateBets < ActiveRecord::Migration
  def change
    create_table :bets do |t|
      t.integer :user_id, null: false
      t.integer :choice_id, null: false
      t.integer :amount, null: false
      t.integer :match
      t.boolean :won

      t.timestamps null: false
    end
  end
end

class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :winner_id
      t.integer :dragons_id
      t.integer :barons_id
      t.integer :killing_spree_id
      t.integer :multi_kill_id

      t.timestamps null: false
    end
  end
end

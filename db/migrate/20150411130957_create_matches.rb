class CreateMatches < ActiveRecord::Migration
  def change
    create_table :matches do |t|
      t.integer :winner
      t.integer :dragons
      t.integer :barons
      t.integer :killing_spree
      t.integer :multi_kill

      t.timestamps null: false
    end
  end
end

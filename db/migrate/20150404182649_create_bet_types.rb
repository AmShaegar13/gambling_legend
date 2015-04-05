class CreateBetTypes < ActiveRecord::Migration
  def change
    create_table :bet_types do |t|
      t.string :label, null: false

      t.timestamps null: false
    end
    add_index :bet_types, :label, unique: true
  end
end

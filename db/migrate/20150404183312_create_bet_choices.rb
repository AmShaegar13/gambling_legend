class CreateBetChoices < ActiveRecord::Migration
  def change
    create_table :bet_choices do |t|
      t.string :label, null: false
      t.integer :type_id, null: false

      t.timestamps null: false
    end
  end
end

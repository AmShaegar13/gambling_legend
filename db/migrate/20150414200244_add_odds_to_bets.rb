class AddOddsToBets < ActiveRecord::Migration
  def change
    change_table :bets do |t|
      t.float :odds, null: false
    end
  end
end

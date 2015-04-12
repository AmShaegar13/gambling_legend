class RemoveAmountFromBetChoice < ActiveRecord::Migration
  def change
    change_table :bet_types do |t|
      t.remove :amount
    end
  end
end

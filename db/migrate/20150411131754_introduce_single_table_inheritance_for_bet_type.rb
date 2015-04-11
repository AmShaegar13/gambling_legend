class IntroduceSingleTableInheritanceForBetType < ActiveRecord::Migration
  def change
    change_table :bet_types do |t|
      t.string :type
    end
  end
end

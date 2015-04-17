class AddLangToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.string :lang, null: false, default: 'en'
    end
  end
end

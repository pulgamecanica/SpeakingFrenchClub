class CreateCardTranslations < ActiveRecord::Migration[7.1]
  def change
    create_table :card_translations do |t|
      t.references :card, null: false, foreign_key: true
      t.references :lang, null: false, foreign_key: true
      t.string :name_translated, null: false
      t.text :info_hints, null: true, default: ""

      t.timestamps
    end
  end
end

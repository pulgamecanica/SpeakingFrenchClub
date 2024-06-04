class CreatePhrases < ActiveRecord::Migration[7.1]
  def change
    create_table :phrases do |t|
      t.references :card, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end

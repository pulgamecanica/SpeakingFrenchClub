class CreateEventCards < ActiveRecord::Migration[7.1]
  def change
    create_table :event_cards do |t|
      t.references :event, null: false, foreign_key: true
      t.references :card, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end

class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.string :name, null: false
      t.text :description
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.boolean :locked, default: false

      t.timestamps
    end
  end
end

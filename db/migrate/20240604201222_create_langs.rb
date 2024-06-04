class CreateLangs < ActiveRecord::Migration[7.1]
  def change
    create_table :langs do |t|
      t.string :name, null: false
      t.text :flag_svg, null: false

      t.timestamps
    end
  end
end

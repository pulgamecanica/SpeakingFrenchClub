class CreateCards < ActiveRecord::Migration[7.1]
  def change
    create_table :cards do |t|
      t.string :name_fr, null: false
      t.text :icon_svg, null: false

      t.timestamps
    end
  end
end

class CreateFlowers < ActiveRecord::Migration[5.2]
  def change
    create_table :flowers do |t|
      t.string :name, null: false, default: ""
      t.string :color

      t.timestamps
    end
  end
end

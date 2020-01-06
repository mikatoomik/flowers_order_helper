class CreateProportions < ActiveRecord::Migration[5.2]
  def change
    create_table :proportions do |t|
      t.references :composition
      t.references :flower
      t.integer :stems_number

      t.timestamps
    end
  end
end

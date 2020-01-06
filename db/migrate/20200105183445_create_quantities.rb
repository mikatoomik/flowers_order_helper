class CreateQuantities < ActiveRecord::Migration[5.2]
  def change
    create_table :quantities do |t|
      t.references :composition
      t.references :order
      t.integer :compositions_number

      t.timestamps
    end
  end
end

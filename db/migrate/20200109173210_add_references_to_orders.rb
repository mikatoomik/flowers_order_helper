class AddReferencesToOrders < ActiveRecord::Migration[5.2]
  def change
      add_reference :orders, :user, foreign_key: true
      add_column :orders, :name, :string, null: false, default: ""
      add_column :orders, :theme, :text
  end
end

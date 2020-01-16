class AddTypeToComposition < ActiveRecord::Migration[5.2]
  def change
    add_column :compositions, :model, :string
  end
end

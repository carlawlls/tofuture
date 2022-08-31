class AddImages4ToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :img_grid_4, :string
  end
end

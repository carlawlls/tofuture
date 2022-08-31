class AddImageToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :img_url_1, :string
    add_column :products, :img_url_2, :string
    add_column :products, :img_url_3, :string
    add_column :products, :img_grid_1, :string
    add_column :products, :img_grid_2, :string
    add_column :products, :img_grid_3, :string
  end
end

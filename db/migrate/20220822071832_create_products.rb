class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :ticker
      t.float :esg_score
      t.float :er_score
      t.float :sr_score
      t.float :gr_score
      t.text :description
      t.string :name
      t.string :sector
      t.integer :product_type

      t.timestamps
    end
  end
end

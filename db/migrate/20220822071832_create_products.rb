class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :ticker
      t.string :exchange
      t.float :esg_score
      t.float :er_score
      t.float :sr_score
      t.float :gr_score
      t.string :esg_grade
      t.string :e_grade
      t.string :s_grade
      t.string :g_grade
      t.string :e_level
      t.string :s_level
      t.string :g_level
      t.string :esg_level
      t.text :description
      t.string :name
      t.string :sector
      t.integer :product_type, default: 0

      t.timestamps
    end
  end
end

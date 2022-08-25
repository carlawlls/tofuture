class CreatePrices < ActiveRecord::Migration[7.0]
  def change
    create_table :prices do |t|
      t.integer :price_cents
      t.date :date
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end

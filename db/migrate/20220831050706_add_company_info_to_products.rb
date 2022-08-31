class AddCompanyInfoToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :youtube_url, :string
    add_column :products, :company_desc_1, :string
    add_column :products, :company_desc_2, :string
    add_column :products, :company_desc_3, :string
  end
end

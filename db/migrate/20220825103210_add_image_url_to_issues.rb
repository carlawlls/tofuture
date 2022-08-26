class AddImageUrlToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :image_url, :string
  end
end

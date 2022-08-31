class AddIconToIssues < ActiveRecord::Migration[7.0]
  def change
    add_column :issues, :icon, :string
  end
end

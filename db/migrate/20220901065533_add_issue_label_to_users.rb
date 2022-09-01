class AddIssueLabelToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :board_label, :string
    add_column :users, :board_user_image, :string
    add_column :users, :username, :string
    add_column :users, :user_icon, :string
  end
end

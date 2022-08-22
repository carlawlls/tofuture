class CreateIssues < ActiveRecord::Migration[7.0]
  def change
    create_table :issues do |t|
      t.string :issue_name
      t.text :explanation

      t.timestamps
    end
  end
end

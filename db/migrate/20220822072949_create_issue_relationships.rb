class CreateIssueRelationships < ActiveRecord::Migration[7.0]
  def change
    create_table :issue_relationships do |t|
      t.references :issue, null: false, foreign_key: true
      t.string :product_references

      t.timestamps
    end
  end
end

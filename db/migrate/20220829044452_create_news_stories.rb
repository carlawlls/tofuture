class CreateNewsStories < ActiveRecord::Migration[7.0]
  def change
    create_table :news_stories do |t|
      t.string :author
      t.text :content
      t.text :description
      t.string :company
      t.datetime :publishing_time
      t.string :title
      t.string :url
      t.string :image_url
      t.references :issue, null: false, foreign_key: true

      t.timestamps
    end
  end
end

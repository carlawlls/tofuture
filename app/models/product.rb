class Product < ApplicationRecord
  acts_as_taggable_on :issues

  has_many :prices
  has_many :issue_relationships
  has_many :issues, through: :issue_relationships, source: :issue

  enum product_type: [ :company, :stock, :fund]
end

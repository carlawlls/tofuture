class Product < ApplicationRecord
  has_many :prices
  has_many :issue_relationships
  has_many :issues, through: :issue_relationships, source: :issue

end

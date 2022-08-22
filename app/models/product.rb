class Product < ApplicationRecord

  acts_as_favoritable

  has_many :prices
  has_many :issue_relationships
  has_many :issues, through: :issue_relationships, source: :issue
end

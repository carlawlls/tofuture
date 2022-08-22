class Issue < ApplicationRecord
  has_many :issue_relationships
  has_many :products, through: :issue_relationships, source: :product
end

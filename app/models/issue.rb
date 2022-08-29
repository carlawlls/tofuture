class Issue < ApplicationRecord
  has_many :issue_relationships
  has_many :news_stories
  has_many :products, through: :issue_relationships, source: :product
  include PgSearch::Model
  multisearchable against: :issue_name

  pg_search_scope :search_by_issue_name,
  against: :issue_name,
  using: {
    tsearch: { prefix: true }
  }
end

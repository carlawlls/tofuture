class Product < ApplicationRecord

  acts_as_taggable_on :issues


  acts_as_favoritable


  has_many :prices
  has_many :issue_relationships
  has_many :issues, through: :issue_relationships, source: :issue
  include PgSearch::Model
  multisearchable against: [:name, :ticker]
  enum product_type: [ :company, :stock, :fund]


  pg_search_scope :search_by_name_and_ticker,
  against: [ :name, :ticker ],
  using: {
    tsearch: { prefix: true }
  }

  SECTORS = ['Healthcare', 'Materials', 'Real Estate', 'Consumer Staples', 'Consumer Discretionary', 'Utilities', 'Energy', 'Industrials', 'Consumer Services', 'Financials', 'TECHNOLOGY', 'MANUFACTURING']
  TYPES = ['Stock', 'Fund']
end

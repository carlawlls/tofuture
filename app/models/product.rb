class Product < ApplicationRecord

  acts_as_taggable_on :issues
  acts_as_favoritable

  has_many :prices
  has_many :issue_relationships, dependent: :destroy
  has_many :issues, through: :issue_relationships, source: :issue
  include PgSearch::Model
  multisearchable against: [:name, :ticker]
  enum product_type: [ "Company", "Stock", "Fund"]


  pg_search_scope :search_by_name_and_ticker,
  against: [ :name, :ticker ],
  using: {
    tsearch: { prefix: true }
  }

  SECTORS = ['Trade & Services', 'Finance', 'Life Sciences', 'Energy & Transportation', 'Consumer Discretionary', 'Utilities', 'Industrials', 'Consumer Services', 'Technology', 'Manufacturing']

  SECTOR_LABELS = SECTORS

  SECTORS = SECTORS.map do |sector|
    sector.upcase
  end

  TYPES = ['Company', 'Stock', 'Fund']
end

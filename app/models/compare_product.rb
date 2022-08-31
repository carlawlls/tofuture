class CompareProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :product_id, uniqueness: true
end

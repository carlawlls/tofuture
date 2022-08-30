class CompareProduct < ApplicationRecord
  belongs_to :user
  belongs_to :product
  # validates :compare_product, presence: true, uniqueness: { scope: :product_id }
end

class Price < ApplicationRecord
  belongs_to :product
  monetize :price_cents # in USD
end

# monetize_gem_config is found in intializers called money.rb

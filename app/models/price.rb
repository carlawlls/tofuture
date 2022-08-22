class Price < ApplicationRecord
  belongs_to :product
  monetize :price # in USD
end

# monetize_gem_config is found in intializers called money.rb

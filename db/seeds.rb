require "uri"
require "json"
require "open-uri"
require_relative "download_json"
puts "destroying sweet stocks"
puts "creating sweet stocks..."
puts "destroying users"
puts "creating users"
Product.destroy_all
User.destroy_all



if ENV['download']
  puts 'download'
  download_symbols
  # download_esg
end
dir = File.dirname(__FILE__)
Dir[File.join(dir, "test_stocks/*.json")].sort.each do |file1|
  puts file1
  json = File.open(file1).read
  p product_info = JSON.parse(json)
  Product.create!(
    ticker: product_info["Symbol"],
    name: product_info["Name"],
    exchange: product_info["Exchange"],
    description: product_info["Description"],
    sector: product_info["Sector"],
    er_score: rand(0.000..10.000),
    sr_score: rand(0.000..10.000),
    gr_score: rand(0.000..10.000),
    esg_score: rand(0.000..10.000)
  )
end




# # FOR ESG SCORES CURRENTLY NOT WORKING DO NOT TOUCH

# stringfied_products = Product.all.map do |product|
#   "#{product.exchange}:#{product.ticker}"
# end.join(",")

# # https://www.esgenterprise.com/esg-enterprise-data-api-services/

# response = URI.open("https://tf689y3hbj.execute-api.us-east-1.amazonaws.com/prod/authorization/search?q=#{stringfied_products}&token=#{ENV['ESG_API_KEY']}").read

# response.each do |esg_info|
#   product = Product.find_by(ticker: esg_info["stock_symbol"])
#   next unless product

#   product.esg_score = esg_info["total"]
#   product.er_score = esg_info["environment_score"]
#   product.sr_score = esg_info["social_score"]
#   product.gr_score = esg_info["governance_score"]
#   product.save
# end


# Dir[File.join(dir, "test_esgs/*.json")].sort.each do |file2|
#   puts file2
#   json = File.open(file2).read
#   p esg_info = JSON.parse(json)
#   Product.create!(
#     product = Product.find_by(ticker: esg_info["stock_symbol"]),

#     product.er_score = esg_info["environment_score"],
#     product.sr_score = esg_info["social_score"],
#     product.gr_score = esg_info["governance_score"],
#     product.esg_score = esg_info["total"]
#   )
# end
User.create!(
  email: "billcook8122@gmail.com",
  password: "123123",
)

User.create!(
  email: "willmes.carla@gmail.com",
  password: "123123",
)

User.create!(
  email: "ayakayakaaaa@gmail.com",
  password: "123123",
)

User.create!(
  email: "jdchappelow@gmail.com",
  password: "123123",
)

User.all.each do |user|
  3.times do
    user.favorite(Product.all.sample)
  end
end

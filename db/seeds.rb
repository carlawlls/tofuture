require "uri"
require "json"
require "open-uri"
require_relative "download_json"
puts "destroying sweet stocks"
Product.destroy_all
puts "creating sweet stocks..."

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

User.all.each do |user|
  3.times do
    user.favorite(Product.all.sample)
  end
end

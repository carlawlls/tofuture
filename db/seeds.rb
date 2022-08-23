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

# ISSUES SEED -------------------------------------------------

#Environment
Issue.create!(
  issue_name: "Carbon emissions",
  explanation: "Greenhouse gas emissions from human activities strengthen the greenhouse effect, causing climate change. Most is carbon dioxide from burning fossil fuels: coal, oil, and natural gas."
)

Issue.create!(
  issue_name: "Air and water pollution",
  explanation: "Usually, air pollution affects the respiratory system, causing difficulty in breathing, COPD, respiratory infections, asthma and even lung cancer. It can also affect existing cardiac conditions. Whilst, water pollution usually affects the digestive system, but can also affect other body systems depending upon the type of pollutant or pathogen present in the water."
)


Issue.create!(
  issue_name: "Deforestation",
  explanation: "Deforestation is the purposeful clearing of forested land. Throughout history and into modern times, forests have been razed to make space for agriculture and animal grazing, and to obtain wood for fuel, manufacturing, and construction. Deforestation has greatly altered landscapes around the world."
)


Issue.create!(
  issue_name: "Green energy initiatives",
  explanation: "Renewable energy is energy that is collected from renewable resources that are naturally replenished on a human timescale. It includes sources such as sunlight, wind, the movement of water, and geothermal heat."
)

Issue.create!(
  issue_name: "Waste management",
  explanation: "Waste management deals with all types of waste, including industrial, biological, household, municipal, organic, biomedical, radioactive wastes. In some cases, waste can pose a threat to human health. Health issues are associated throughout the entire process of waste management."
)

#Social

Issue.create!(
  issue_name: "Employee gender and diversity",
  explanation: "Gender and racial diversity is equitable or fair representation of people of different genders and/or races."
)

Issue.create!(
  issue_name: "Human rights at home and abroad",
  explanation: "Human rights are moral principles or norms for certain standards of human behaviour and are regularly protected in municipal and international law. They are commonly understood as inalienable, fundamental rights to which a person is inherently entitled simply because she or he is a human being and which are inherent in all human beings, regardless of their age, ethnic origin, location, language, religion, ethnicity, or any other status"
)

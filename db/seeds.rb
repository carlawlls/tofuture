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
Issue.destroy_all

# For Product Creation ----------------------------------------------------
# DO NOT CHANGE THIS AT ALL IT MUST BE KEPT FALSE ONLY LIL COOKIE CAN CHANGE
if false
  download_symbols
end
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
carbon_emissions = ActsAsTaggableOn::Tag.new(name: "Carbon Emissions")
air_pollution = ActsAsTaggableOn::Tag.new(name: "Air Pollution")
water_pollution = ActsAsTaggableOn::Tag.new(name: "Water Pollution")
deforestation = ActsAsTaggableOn::Tag.new(name: "Deforestation")
green_energy = ActsAsTaggableOn::Tag.new(name: "Green Energy")
waste_management = ActsAsTaggableOn::Tag.new(name: "Water Management")
employee_diversity = ActsAsTaggableOn::Tag.new(name: "Employee Diversity")
human_rights = ActsAsTaggableOn::Tag.new(name: "Human Rights")
labor_standards = ActsAsTaggableOn::Tag.new(name: "Labor Standards")
political_lobbying = ActsAsTaggableOn::Tag.new(name: "Political Lobbying")
animal_welfare = ActsAsTaggableOn::Tag.new(name: "Animal Welfare")

issue_tags = [carbon_emissions, air_pollution, water_pollution, deforestation, green_energy, waste_management, employee_diversity, human_rights, labor_standards, political_lobbying, animal_welfare]

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
    issue_list: issue_tags.sample(3)
  )
end

# # https://www.esgenterprise.com/esg-enterprise-data-api-services/

# DO NOT CHANGE THIS AT ALL IT MUST BE KEPT FALSE ONLY LIL COOKIE CAN CHANGE
if false
  download_esg
end
# !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
response = JSON.parse(File.open("db/test_esgs/esg.json").read)
response.each do |esg_info|
  product = Product.find_by(ticker: esg_info["stock_symbol"])
  next unless product

  product.esg_score = esg_info["total"]
  product.er_score = esg_info["environment_score"]
  product.sr_score = esg_info["social_score"]
  product.gr_score = esg_info["governance_score"]
  product.esg_grade = esg_info["total_grade"]
  product.e_grade = esg_info["environment_grade"]
  product.s_grade = esg_info["social_grade"]
  product.g_grade = esg_info["governance_grade"]
  product.esg_level = esg_info["total_level"]
  product.e_level = esg_info["environment_level"]
  product.s_level = esg_info["social_level"]
  product.g_level = esg_info["governance_level"]
  product.save
end

# ISSUES SEED -------------------------------------------------


#Environment

Issue.create!(
  issue_name: "Carbon emissions",
  explanation: "Greenhouse gas emissions from human activities strengthen the greenhouse effect, causing climate change. Most is carbon dioxide from burning fossil fuels: coal, oil, and natural gas."
)

Issue.create!(
  issue_name: "Air pollution",
  explanation: "Air pollution is the contamination of air due to the presence of substances in the atmosphere that are harmful to the health of humans and other living beings, or cause damage to the climate or to materials."
)


Issue.create!(
  issue_name: "Water pollution",
  explanation: "Water pollution (or aquatic pollution) is the contamination of water bodies, usually as a result of human activities, so that it negatively affects its uses."
)


Issue.create!(
  issue_name: "Deforestation",
  explanation: "Deforestation is the purposeful clearing of forested land. Throughout history and into modern times, forests have been razed to make space for agriculture and animal grazing, and to obtain wood for fuel, manufacturing, and construction. Deforestation has greatly altered landscapes around the world."
)


Issue.create!(
  issue_name: "Green energy",
  explanation: "Renewable energy is energy that is collected from renewable resources that are naturally replenished on a human timescale. It includes sources such as sunlight, wind, the movement of water, and geothermal heat."
)

Issue.create!(
  issue_name: "Waste management",
  explanation: "Waste management deals with all types of waste, including industrial, biological, household, municipal, organic, biomedical, radioactive wastes. In some cases, waste can pose a threat to human health. Health issues are associated throughout the entire process of waste management."
)

#Social

Issue.create!(
  issue_name: "Employee diversity",
  explanation: "Gender and racial diversity is equitable or fair representation of people of different genders and/or races."
)

Issue.create!(
  issue_name: "Human rights",
  explanation: "Human rights are moral principles or norms for certain standards of human behaviour and are regularly protected in municipal and international law. They are commonly understood as inalienable, fundamental rights to which a person is inherently entitled simply because she or he is a human being and which are inherent in all human beings, regardless of their age, ethnic origin, location, language, religion, ethnicity, or any other status"
)
User.create!(
  email: "billcook8122@gmail.com",
  password: "123123"
)

User.create!(
  email: "willmes.carla@gmail.com",
  password: "123123"
)
puts "FINISHED! BOY!"

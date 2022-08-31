require 'news-api'
require "uri"
require "json"
require "open-uri"
require_relative "download_json"
puts "destroying sweet stocks"
puts "creating sweet stocks..."
puts "destroying users"
puts "creating users"
IssueRelationship.destroy_all
CompareProduct.destroy_all
Product.destroy_all
User.destroy_all
NewsStory.destroy_all
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
    product_type: 1,
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


# COMPANY SEEDS -----------------------------------------------
Product.create!(
  ticker: "",
  name: "Who Gives a Crap",
  exchange: "",
  description: "Who Gives a Crap is an Australian startup that develops forest friendly toilet paper, paper towels, and tissues. It also donates a portion of the profits to water/sanitation projects in the developing world. Founded in 2012, Who Gives a Crap is based in Melbourne, Victoria.",
  sector: "Wholesale/Retail",
  product_type: 0,
  issue_list: ["Green Energy", "Water Pollution", "Deforestation"],
  web_url: 'https://au.whogivesacrap.org/'
)

Product.create!(
  ticker: "",
  name: "Teapigs",
  description: "Teapigs is a UK-based tea company owned by Tata Global Beverages Ltd, founded in November 2006. They produce a wide range of teas, including black, green, oolong, white, rooibos, Herbal teas, and Matcha tea.",
  product_type: 0,
  sector: "Wholesale/Retail",
  issue_list: ["Labor Standards", "Human Rights", "Employee Diversity"],
  web_url: 'https://www.teapigs.co.uk/',
  youtube_url: '9_oGPywjwo8',
  company_desc_1: "Teapig's focus is on real, quality tea, sourced sustainably, in packaging that’s better for the environment. They give back to the communities that source their tea. Teapigs is very proud to be a B Corp certified.",
  company_desc_2: "Teapigs is the first tea company awarded the Plastic-Free trustmark from A Plastic Planet. This certifies packaging which is free of conventional plastic derived from fossil fuels. Our 15s and 50s packs of tea temples, our tins of tea and matcha tins are certified plastic-free.",
  company_desc_3: "Teapigs is proud to be a certified B Corp; joining a wonderful global community committed to using business as a force for good. B Corp is about purpose, and the overall positive impact of a company. Rather than focusing on a product, B Corp analyse a company’s impact on its workers, customers, community, and environment. To become B Corp certified, companies are assessed and audited, and have to meet the highest standards of social and environmental performance, accountability, and transparency. ",
  img_url_1: "pickers.jpg",
  img_url_2: "product_content.jpg",
  img_url_3: "donation.jpg",
  img_grid_1: "certified_b_coporation.jpg",
  img_grid_2: "rainforest.jpg",
  img_grid_3: "plastic_free.jpg",
  img_grid_4: "susinstable_restaurant_association.jpg"
)

Product.create!(
  ticker: "",
  name: "Gorongosa",
  description: "100% of profits from Gorongosa specialty coffee support Gorongosa National Park in Mozambique and the people who call it home. Gorongosa believe that people and the planet can thrive together. Every cup of Gorongosa Coffee helps replant a rainforest, restore wildlife and build a future for the communities surrounding Gorongosa National Park.",
  product_type: 0,
  sector: "Wholesale/Retail",
  issue_list: ["Labor Standards", "Human Rights", "Deforestation"],
  web_url: 'https://gorongosa.org/coffee/',
  youtube_url: 'iT7yHG01_UI',
  company_desc_1: "Gorongosa Coffee brings you coffee from the slopes of Mount Gorongosa achieving rainforest reforestation and employing local farmers. 100% of our profits fund  conservation and human development projects in and around Gorongosa National Park. When you purchase any of Gorongosa products, you become part of our self sustaining system that helps to restore and protect the park, creates jobs and provides healthcare, training and education for its people.",
  company_desc_2: "Advance an integrated multi-partner approach to conservation and to people-centred development. The Gorongosa Project protects the Park’s biodiversity and ecosystem services and unlocks its economic potential for the community inhabitants of the Gorongosa Buffer Zone, Sofala Province, Mozambique and further afield.",
  company_desc_3: "Education is how we hope to shape the future. At Gorongosa National Park, we teach local people (especially children) the principles and values of environmental conservation so they will be willing and able to help us protect the Park in the future.",
  img_url_1: "coffee.jpg",
  img_url_2: "project.jpg",
  img_url_3: "schools.jpg",
  img_grid_1: "certified_b_coporation.jpg",
  img_grid_2: "direct_trade_logo.jpeg",
  img_grid_3: "plastic_free.jpg",
  img_grid_4: "susinstable_restaurant_association.jpg"
)

Product.create!(
  ticker: "",
  name: "Plamil Foods Ltd",
  exchange: "",
  description: "Plamil is a pioneering ethical company, producing vegan, organic and Fairtrade products since the 1960's. It is an ethical leader in the food industry, and one the most ethical companies that Ethical Consumer rates and ranks in its product guides.",
  product_type: 0,
  sector: "Wholesale/Retail",
  issue_list: ["Labor Standards", "Human Rights", "Animal Welfare"],
  web_url: 'https://www.plamilfoods.co.uk/'
)
# ETFs --------------------------------------------------------

Product.create!(
  ticker: "ERTH",
  name: "Invesco MSCI Sustainable Future ETF",
  exchange: "NYSE",
  description: "The Invesco MSCI Sustainable Future ETF invests in companies from around the world that offer products and services that contribute to a more environmentally sustainable economy. The fund invests in small-, mid- and large-cap companies from around the world. Companies are eligible for inclusion in the index if they derive 75% or more of their cumulative revenue from six areas: alternative energy, energy efficiency, green building, sustainable water, pollution prevention and control, and sustainable agriculture. The index excludes companies that faced very severe controversies related to environmental, social and governance issues in the last three years, as well as companies involved in controversial weapons. The fund is among dozens of ETFs that target companies that compare favorably on environmental, social and governance criteria, also known as ESG. ESG funds are an increasingly popular segment of the ETF marketplace, offering values-driven investors a diverse portfolio of U.S. stocks without compromising their conscience. ERTH is part of a narrower subset of ESG known as impact funds, whose goal is to invest in companies that try to bring about a measurable, beneficial social or environmental impact. Invesco’s fund fees are reasonable for the segment, though fees for impact ETFs tend to be significantly higher than plain-vanilla index funds and some broad-based ESG funds. The holdings are also significantly narrower. Due to the increased diversification and concentration risk of its portfolio, ERTH is not a good replacement for a core global equity position though it may be a good complement for investors committed to sustainable businesses.",
  sector: "Alternative Energy Equities",
  esg_score: 7.8,
  product_type: 2,
  issue_list: ["Green Energy", "Water Pollution", "Deforestation"]
)

Product.create!(
  ticker: "ACES",
  name: "ALPS",
  exchange: "NYSE",
  sector: "Alternative Energy Equities",
  description: "The ALPS Clean Energy ETF (ACES) seeks investment results that correspond (before fees and expenses) generally to the performance of its underlying index, the CIBC Atlas Clean Energy Index (NACEX).The ALPS Clean Energy ETF (ACES) delivers exposure to a diverse set of US and Canadian companies involved in the clean energy sector including renewables and clean technology. The clean energy sector is comprised of companies that provide the products and services that enable the evolution of a more sustainable energy sector.",
  esg_score: 8.43,
  product_type: 2,
  issue_list: ["Green Energy", "Water Pollution", "Carbon Emissions"]
)

Product.create!(
  ticker: "HYDR",
  name: "Global X Hydrogen ETF",
  sector: "Alternative Energy Equities",
  exchange: "NYSE",
  description: "The Global X Hydrogen ETF (HYDR) seeks to invest in companies that stand to benefit from the advancement of the global hydrogen industry. This includes companies involved in hydrogen production; the integration of hydrogen into energy systems; and the development/manufacturing of hydrogen fuel cells, electrolyzers, and other technologies related to the utilization of hydrogen as an energy source.",
  esg_score: 6.96,
  product_type: 2,
  issue_list: ["Carbon Emissions", "Labor Standards", "Employee Diversity"]
)

Product.create!(
  ticker: "IYZ",
  name: "iShares U.S. Telecommunications ETF",
  sector: "Technology",
  exchange: "NYSE",
  description: "This ETF offers exposure to the U.S. telecom market, making it one option available to investors implementing a sector rotation strategy or focusing on corners of the domestic stock market that generally offer attractive dividend yields. Like most other telecom ETFs, IYZ is concentrated in a relatively small number of mega cap companies, resulting in a top heavy structure (State Street’s XTL is linked to an equal-weighted index, delivering more balanced exposure to the telecom sector). Another drawback of this ETF is expenses. IYZ is not competitive on price; both VOX and FCQ offer similar exposure with a much lower price tag. Those looking to achieve exposure to the global telecom market may consider IYZ, while those looking to steer clear of the U.S. altogether might like IST or AXTE.",
  esg_score: 8.0,
  product_type: 2,
  issue_list: ["Human Rights", "Labor Standards", "Political Lobbying"]
)

Product.create!(
  ticker: "BSCE",
  name: "Invesco BulletShares 2023 USD Emerging Markets Debt ETF",
  exchange: "NYSE",
  sector: "Emerging Markets Bonds",
  description: "BSCE offers focused exposure to investment grade corporate bonds maturing in 2014, making it much more granular than many other products. Most bond ETFs focus on securities maturing within a certain number of years (such as 1-5 year Treasuries or 20+ year corporate bonds). These bond ETFs generally operate indefinitely, maintaining a similar duration and interest rate risk across time and reinvesting any proceeds from the sale of component bonds into new securities. BSCE is different in that it has a target maturity date and will eventually close down after the underlying bonds have reached maturity and the principal has been distributed to shareholders (over time, BSCE’s portfolio will gradually shift to cash).",
  esg_score: 8.0,
  product_type: 2,
  issue_list: ["Carbon Emissions", "Labor Standards", "Deforestation"]
)

Product.create!(
  ticker: "BBH",
  name: "VanEck Biotech ETF",
  sector: "Health & Biotech Equities",
  exchange: "NYSE",
  description: "This ETF offers targeted exposure to the biotech industry, a corner of the health care sector that is capable of delivering big returns but also exhibiting significant volatility. Given that risk/return profile, accessing biotech through the exchange-traded wrapper has some obvious appeal; it allows investors to spread out exposure, thereby increasing the opportunity of holding a stock that hits it big. Given that targeted objective, this ETF is probably most useful for those seeking tactical exposure to this corner of the market; the underlying holdings are generally found in broad-based equity ETFs, so there should be little appeal to buy-and-holders.",
  esg_score: 7.41,
  product_type: 2,
  issue_list: ["Human Rights", "Labor Standards", "Political Lobbying"]
)

Product.create!(
  ticker: "JHMS",
  name: "John Hancock Multifactor Consumer Staples ETF",
  sector: "Consumer Staples Equities",
  exchange: "NYSE",
  description: "The Fund seeks to provide investment results that closely correspond, before fees and expenses, to the performance of the John Hancock Dimensional Consumer Staples Index. The Fund invests at least 80% of its net assets (plus any borrowings for investment purposes) in securities that compose the fund's benchmark index.",
  esg_score: 9.56,
  product_type: 2,
  issue_list: ["Air Pollution", "Green Energy", "Water Pollution"]
)


# ISSUES SEED -------------------------------------------------


#Environment

Issue.create!(
  issue_name: "Carbon Emissions",
  explanation: "Greenhouse gas emissions from human activities strengthen the greenhouse effect, causing climate change. Most is carbon dioxide from burning fossil fuels: coal, oil, and natural gas.",
  image_url: "data:image/jpeg;base64,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",
  icon: "005-co2-cloud.png"
)

Issue.create!(
  issue_name: "Air Pollution",
  explanation: "Air pollution is the contamination of air due to the presence of substances in the atmosphere that are harmful to the health of humans and other living beings, or cause damage to the climate or to materials.",
  image_url: "http://chinapower.csis.org/wp-content/uploads/2017/07/AdobeStock_76247895_shanghai_pollution_header.jpg",
  icon: "006-air-pollution.png"
)


Issue.create!(
  issue_name: "Water Pollution",
  explanation: "Water pollution (or aquatic pollution) is the contamination of water bodies, usually as a result of human activities, so that it negatively affects its uses.",
  image_url: "data:image/jpeg;base64,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",
  icon: "004-pollution.png"
)


Issue.create!(
  issue_name: "Deforestation",
  explanation: "Deforestation is the purposeful clearing of forested land. Throughout history and into modern times, forests have been razed to make space for agriculture and animal grazing, and to obtain wood for fuel, manufacturing, and construction. Deforestation has greatly altered landscapes around the world.",
  image_url: "https://cdn.mos.cms.futurecdn.net/WVMczmo522VVf5XLsEavaW-1200-80.jpg",
  icon: "007-deforestation.png"
)


Issue.create!(
  issue_name: "Green Energy",
  explanation: "Renewable energy is energy that is collected from renewable resources that are naturally replenished on a human timescale. It includes sources such as sunlight, wind, the movement of water, and geothermal heat.",
  image_url: "https://caspiannews.com/media/caspian_news/all_original_photos/1571153138_4329836_1571152765_98610523266804.jpg",
  icon: "003-light-bulb.png"
)

Issue.create!(
  issue_name: "Waste Management",
  explanation: "Waste management deals with all types of waste, including industrial, biological, household, municipal, organic, biomedical, radioactive wastes. In some cases, waste can pose a threat to human health. Health issues are associated throughout the entire process of waste management.",
  image_url: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBDpqa9qxlitazS4rQUNPLhC7VLpVw9v6WQg&usqp=CAU",
  icon: "008-trash.png"
)

#Social

Issue.create!(
  issue_name: "Employee Diversity",
  explanation: "Gender and racial diversity is equitable or fair representation of people of different genders and/or races.",
  image_url: "https://www.concentrix.com/wp-content/uploads/2017/09/Workplace-Diversity.jpg",
  icon: "together.png"
)

Issue.create!(
  issue_name: "Human Rights",
  explanation: "Human rights are moral principles or norms for certain standards of human behaviour and are regularly protected in municipal and international law. They are commonly understood as inalienable, fundamental rights to which a person is inherently entitled simply because she or he is a human being and which are inherent in all human beings, regardless of their age, ethnic origin, location, language, religion, ethnicity, or any other status",
  image_url: "https://www.airbus.com/sites/g/files/jlcbta136/files/styles/airbus_480x480/public/2021-06/human-rights-illustration.jpg?itok=FgBpQEO2",
  icon: "protest.png"
)

Issue.create!(
  issue_name: "Labor Standards",
  explanation: "Labour laws (also known as labor laws or employment laws) are those that mediate the relationship between workers, employing entities, trade unions, and the government. Collective labour law relates to the tripartite relationship between employee, employer, and union. Individual labour law concerns employees' rights at work also through the contract for work.",
  image_url: "https://www.incimages.com/uploaded_files/image/1920x1080/getty_533979847_128300.jpg",
  icon: "001-standard.png"
)

Issue.create!(
  issue_name: "Political Lobbying",
  explanation: "In politics, lobbying, persuasion or interest representation is the act of lawfully attempting to influence the actions, policies, or decisions of government officials, most often legislators or members of regulatory agencies. Lobbying, which usually involves direct, face-to-face contact, is done by many types of people, associations and organized groups, including individuals in the private sector, corporations, fellow legislators or government officials, or advocacy groups (interest groups).",
  image_url: "https://images.theconversation.com/files/434574/original/file-20211129-25-1xtkgx6.jpg?ixlib=rb-1.1.0&rect=8%2C601%2C5982%2C2991&q=45&auto=format&w=668&h=324&fit=crop",
  icon: "009-court.png"
)

Issue.create!(
  issue_name: "Animal Welfare",
  explanation: "In politics, lobbying, persuasion or interest representation is the act of lawfully attempting to influence the actions, policies, or decisions of government officials, most often legislators or members of regulatory agencies. Lobbying, which usually involves direct, face-to-face contact, is done by many types of people, associations and organized groups, including individuals in the private sector, corporations, fellow legislators or government officials, or advocacy groups.",
  image_url: "https://p.potaufeu.asahi.com/39eb-p/picture/24453900/ccfe2b8c90130e5302445beb35e58387.jpg",
  icon: "protest.png"
)

User.create!(
  email: "billcook8122@gmail.com",
  password: "123123"
)

User.create!(
  email: "willmes.carla@gmail.com",
  password: "123123"
)

User.create!(
  email: "jdchappelow@gmail.com",
  password: "123123"
)

User.create!(
  email: "ayakayakaaaa@gmail.com",
  password: "123123"
)

Product.all.each do |product|
  Issue.all.each do |issue|
    if product.issue_list.include?(issue.issue_name)
      IssueRelationship.create!(
        product: product,
        issue: issue
      )
    end
  end
end

# Limit on the news API
# newsapi = News.new("1eaedf572be74827bce43637e0c790c8")


# bill 2123f459a20a43a48a4ae71a94917dda
# josh 1eaedf572be74827bce43637e0c790c8

# Issue.all.each do |issue|
#   issue_news = newsapi.get_top_headlines(q: issue.issue_name, from: "2022-08-01&to=2022-08-29", sortBy: "popularity")
#   issue_news.each do |news|
#     NewsStory.create!(
#       author: news.author,
#       company: news.name,
#       description: news.description,
#       content: news.content,
#       url: news.url,
#       image_url: news.urlToImage,
#       title: news.title,
#       publishing_time: news.publishedAt,
#       issue: issue
#     )
#   end
# end

puts "FINISHED! BOY!"

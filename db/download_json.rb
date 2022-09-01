require "json"
require "open-uri"


def download_symbols
  p stock_symbols = ["BHIL", "OTLY", "INGR", "APPH", "TTCF"]
  stock_symbols.each do |symbol|
    url = URI.parse("https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{symbol}&apikey=#{ENV["ALPHA_VANTAGE_KEY"]}")
    items_search = URI.open(url).read
    File.open("db/test_stocks/#{symbol}.json", 'wb') do |f|
      f.write(items_search)
    end
  end
end


def download_esg

  products = Product.all.map {|product| "#{product.exchange}:#{product.ticker}"}.join(",")
  p products
  return if products.blank?

  # https://www.esgenterprise.com/esg-enterprise-data-api-services/

  p url = "https://tf689y3hbj.execute-api.us-east-1.amazonaws.com/prod/authorization/search?q=#{products}&token=#{ENV['ESG_API_KEY']}"
  response = URI.open(url).read
  p response
  File.open("db/test_esgs/esg.json", 'wb') do |f|
    f.write(response)
  end
end





# url = URI.parse("https://tf689y3hbj.execute-api.us-east-1.amazonaws.com/prod/authorization/search?q=nyse:xom,nasdaq:tsla,tse:alc&token=980a40bd5d6da922f92798461b05a912")

# # https://www.esgenterprise.com/esg-enterprise-data-api-services/




# url2 = URI.parse("https://www.alphavantage.co/query?function=OVERVIEW&symbol=TSLA&apikey=V9QPU9YV92FPLJD1")

# items_search2 = URI.open

# ["INTC", "CMI", "ACN", "XOM", "IBM"
# ["ECL", "AFL", "BBY", "CL", "BYND"]


# "ACN", "XOM", "IBM", "ECL", "AFL", "BBY", "CL", "BYND"

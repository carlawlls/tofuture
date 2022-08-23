require "json"
require "open-uri"


def download_symbols
  stock_symbols = ["INTC", "CMI", "ACN", "XOM", "IBM"]
  stock_symbols.each do |symbol|
    url = URI.parse("https://www.alphavantage.co/query?function=OVERVIEW&symbol=#{symbol}&apikey=#{ENV["ALPHA_VANTAGE_KEY"]}")
    items_search = URI.open(url).read
    File.open("db/test_stocks/#{symbol}.json", 'wb') do |f|
      f.write(items_search)
    end
  end
end


# def download_esg
#   stock_symbols = ["INTC", "CMI", "ACN", "XOM", "IBM"]
#   stock_symbols.each do |symbol|
#     url = URI.parse("https://tf689y3hbj.execute-api.us-east-1.amazonaws.com/prod/authorization/search?q=#{stock_symbols}&token=#{ENV['ESG_API_KEY']}")
#     items_search = URI.open(url).read
#     File.open("db/test_esgs/#{symbol}.json", 'wb') do |f|
#       f.write(items_search)
#     end
#   end
# end





# url = URI.parse("https://tf689y3hbj.execute-api.us-east-1.amazonaws.com/prod/authorization/search?q=nyse:xom,nasdaq:tsla,tse:alc&token=980a40bd5d6da922f92798461b05a912")

# # https://www.esgenterprise.com/esg-enterprise-data-api-services/




# url2 = URI.parse("https://www.alphavantage.co/query?function=OVERVIEW&symbol=TSLA&apikey=V9QPU9YV92FPLJD1")

# items_search2 = URI.open

require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
puts page.class # => Nokogiri::HTML::Document

def names_collect
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  crypto_names = page.xpath('//a[contains(@class,"cmc-table__column-name--name cmc-link")]')
  final_names = []
  crypto_names.each do |title|
    final_names<<title.text
  end
  return final_names
end

def prices_collect
  page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))
  crypto_price = page.xpath('//div[contains(@class,"sc-cadad039-0 clgqXO")]')
  final_prices = []
  crypto_price.each do |span|
    final_prices<<span.text
  end
  return final_prices
end

def from_names_and_prices_to_ashes(final_names,final_prices)
  result = Hash[final_names.zip final_prices]
  return result
end

puts from_names_and_prices_to_ashes(names_collect,prices_collect)

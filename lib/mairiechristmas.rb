require 'nokogiri'
require 'open-uri'

page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/"))
puts page.class # => Nokogiri::HTML::Document

def url_collect
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  urls_list = page.xpath('//a[contains(@class,"lientxt")]')
  final_url_list = []
  urls_list.each do |href|
    pointsaway = href.values[1].delete_prefix('.')
    final_url_list<<pointsaway
  end
  return final_url_list
end


def email_collect(url)
  page = Nokogiri::HTML(URI.open('http://annuaire-des-mairies.com' + url))
  emails_list = page.xpath('//td[text()="Adresse Email"]//following-sibling::td')
  final_email_list = []
  emails_list.each do |td|
    final_email_list<<td.text
  end
  return final_email_list
end

def mail_crawl
  all_url_lists = url_collect
  very_strong_and_ultimate_list_of_emails = []
  for i in all_url_lists do
    very_strong_and_ultimate_list_of_emails<<email_collect(i)
  end
  return very_strong_and_ultimate_list_of_emails
end

def names_collect
  page = Nokogiri::HTML(URI.open("http://annuaire-des-mairies.com/val-d-oise.html"))
  urls_list = page.xpath('//a[contains(@class,"lientxt")]')
  final_names_list = []
  urls_list.each do |href|
  final_names_list<<href.text
  end
  return final_names_list
end

def from_names_and_mails_to_ashes(names_collect,mail_crawl)
  result = Hash[names_collect.zip mail_crawl]
  return result
end

puts from_names_and_mails_to_ashes(names_collect,mail_crawl)



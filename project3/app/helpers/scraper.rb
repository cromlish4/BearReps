require 'nokogiri'
require 'httparty'
require 'byebug'
require 'mechanize'
require 'rubygems'
require 'net/http'
require 'uri'
require 'json'

def scraper(class_number)
  # initial setup
  url = "https://courses.osu.edu/psp/csosuct/EMPLOYEE/PUB/c/COMMUNITY_ACCESS.OSR_CAT_SRCH.GBL?"
  mechanize = Mechanize.new

  #get page
  page = mechanize.get(url)

  #get fields and fill them out
  forms = page.forms[0]
  forms['OSR_CAT_SRCH_WK_CATALOG_NBR'] = class_number
  forms['OSR_CAT_SRCH_WK_DESCR'] = 'Computer Science & Engineering'

  #submit form
  page = forms.submit
  #=====problems start here. must somehow read POST request made, I'll work on this tomorrow

  #read header
  header = Hash.new

  page.header.each do |n|
    header.store(n[0], n[1])
  end

  #send POST request
  uri = page.uri
  http = Net::HTTP.new(uri.host, uri.port)
  http.use_ssl = true
  http.verify_mode = OpenSSL::SSL::VERIFY_NONE # VERIFY_PEER in production https://stackoverflow.com/questions/9336884/getting-a-connection-reset-by-peer-error-when-hitting-google-contacts-api
  request = Net::HTTP::Post.new(uri.request_uri, header)
  response = http.request(request)
  puts response.body
end

puts 'Starting program'
scraper('3901')
puts 'Ending program'
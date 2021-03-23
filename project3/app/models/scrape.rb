class Scrape < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'

  @@terms = { 'summer' => 1214, 'spring' => 1212, 'autumn' => 1218 }
  @@campuses = { 'columbus' => 'col', 'marion' => 'mrn', 'newark' => 'nwk', 'lima' => 'lma', 'wooster' => 'wst', "mansfield" => 'mns' }
  @@course_keys = %w[title term maxUnits campus] #, catalogNumber]
  @@scraped_courses = nil
  @@chosen_course = nil

  def self.scrape(query, term, campus)
    # initial setup
    query = query.gsub(" ", "%20")
    url = "https://content.osu.edu/v2/classes/search?q=#{query}&campus=#{campus}&term=#{term}&p=1&subject=cse"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    # Parse data into a hashset
    parsed_data = JSON.parse(response)

    courses = parsed_data['data']['courses']

    return courses
  end

  def self.extract_courses(scraped_hash)
    if scraped_hash
      courses = Hash.new

      scraped_hash.each do |c|
        attributes = Hash.new
        @@course_keys.each do |k|
          attributes[k] = c['course'][k]
        end
        courses[c['course']['catalogNumber']] = attributes
      end
      @@scraped_courses = courses
    else
      nil
    end
  end

  def self.get_scraped_courses
    @@scraped_courses
  end

  def self.set_empty_chosen_course
    @@chosen_course = Hash.new
    @@chosen_course['catalogNumber'] = ''

    @@course_keys.each do |attribute|
      @@chosen_course[attribute] = ''
    end

  end

  def self.set_chosen_course(key)
    @@chosen_course = @@scraped_courses[key]
    @@chosen_course['catalogNumber'] = key
  end

  def self.get_chosen_course
    @@chosen_course
  end

  def self.get_terms
    @@terms
  end

  def self.get_campuses
    @@campuses
  end

  def self.get_course_keys
    @@course_keys
  end

end

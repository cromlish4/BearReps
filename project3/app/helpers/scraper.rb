require 'net/http'
require 'uri'
require 'json'

class Scraper
  @@terms = { 'summer' => 1214, 'spring' => 1212, 'autumn' => 1218 }
  @@campuses = { 'columbus'=> 'col', 'marion'=> 'mrn', 'newark'=> 'nwk', 'lima'=> 'lma', 'wooster'=> 'wst', "mansfield"=> 'mns' }
  @@course_keys = %w[subject catalogNumber shortDescription title term maxUnits component campus]
  @@section_keys = %w[section classNumber courseId component instructionMode meetings enrollmentStatus startDate endDate]

  def self.scrape(query, term, campus)
    # initial setup
    query = query.gsub(" ", "%20")
    url = "https://content.osu.edu/v2/classes/search?q=#{query}&campus=#{campus}&term=#{term}&p=1&subject=cse"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    # Parse data into a hashset
    parsed_data = JSON.parse(response)

    courses = parsed_data['data']['courses']
    # Example of how to print out information
    # Very likely the first element will have what you want for an exact search
    # courses.each do |n|
    #   #print out the course information
    #   @@course_keys.each { |k| puts "#{k} : #{n['course'][k]}"}
    #   puts "\n"
    #   #print out each sections information
    #   n['sections'].each { |s| @@section_keys.each { |k| puts "#{k} : #{s[k]}"}; puts "\n"}
    #   #waits for user to press enter
    #   gets
    #   puts "\n"
    # end

    return courses
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

  def self.get_section_keys
    @@section_keys
  end

  # Example of how you might call the program, just replace @@ with the methods
  # scrape('cse 3901', @@terms['spring'], @@campuses['columbus'])
end
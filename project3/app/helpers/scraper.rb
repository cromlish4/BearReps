require 'net/http'
require 'uri'
require 'json'

def scraper(query)
  # initial setup
  query = query.gsub(" ", "%20")
  url = "https://content.osu.edu/v2/classes/search?q=#{query}&campus=col&term=1214&p=1"
  uri = URI(url)
  response = Net::HTTP.get(uri)
  # Parse data into a hashset
  parsed_data = JSON.parse(response)
  # In all likelihood courses[0] is all you need for the query being searched
  courses = parsed_data['data']['courses']

  # Example of how to print out information
  # Create keys for important information
  # course_keys = %w[catalogNumber title shortDescription description maxUnits component campus courseId]
  # section_keys = %w[classNumber section component instructionMode enrollmentStatus]
  #
  # courses.each do |n|
  #   course_keys.each { |k| puts "#{k} : #{n['course'][k]}"}
  #   section_keys.each { |k| puts "#{k} : #{n['sections'][0][k]}"}
  #   puts "\n"
  # end

  return courses
end

# Example of how you might call the program
#scraper('cse 3901')
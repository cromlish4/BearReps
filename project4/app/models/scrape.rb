class Scrape < ApplicationRecord
  require 'net/http'
  require 'uri'
  require 'json'

  @@terms = { 'summer' => 1214, 'spring' => 1212, 'autumn' => 1218 }
  @@campuses = { 'columbus' => 'col', 'marion' => 'mrn', 'newark' => 'nwk', 'lima' => 'lma', 'wooster' => 'wst', "mansfield" => 'mns' }
  @@course_keys = %w[title term maxUnits campus] #, catalogNumber]
  @@section_keys = %w[section component instructionMode enrollmentStatus startDate endDate term waitlistTotal meetings] #, classNumber]
  @@database_section_keys = %w[enrollmentStatus instructionMode component classNumber section meetingDays meetingTimes waitlistTotal courseID grader]
  @@scraped_courses = nil
  @@chosen_course = nil
  @@scraped_sections = nil
  @@chosen_section = nil

  def self.scrape(query, term, campus)
    # initial setup with given variables
    query = query.gsub(" ", "%20")
    url = "https://content.osu.edu/v2/classes/search?q=#{query}&campus=#{campus}&term=#{term}&p=1&subject=cse"
    uri = URI(url)

    response = Net::HTTP.get(uri)
    # Parse data into a hash
    parsed_data = JSON.parse(response)

    courses = parsed_data['data']['courses']

    return courses
  end

  def self.extract_courses(scraped_hash)
    if scraped_hash
      courses = Hash.new

      # Extract the course information
      scraped_hash.each do |c|
        attributes = Hash.new
        # Place course information into attributes temporarily
        @@course_keys.each do |k|
          attributes[k] = c['course'][k]
        end
        # add extracted info into hash with the course number being the key
        courses[c['course']['catalogNumber']] = attributes
      end
      @@scraped_courses = courses
    else
      nil
    end
  end

  def self.extract_sections(scraped_hash)
    if scraped_hash
      #all sections for every scraped course
      all_sections = Hash.new

      #go through each course
      scraped_hash.each do |c|
        sections = Hash.new
        #for each course, extract their sections
        c['sections'].each do |s|
          attributes = Hash.new
          #extract attributes
          @@section_keys.each do |k|
            if k != 'meetings'
              attributes[k] = s[k]
            else
              puts 'ph'
              days = %w[monday tuesday wednesday thursday friday saturday sunday]
              meetingsOn = ""
              days.each do |day|
                if s[k][0][day] == true
                  to_add = day[0].capitalize()
                  if day == 'thursday'
                    to_add = "R"
                  end
                  meetingsOn += to_add
                end
              end
              attributes['meetingDays'] = meetingsOn
              attributes['meetingTimes'] = "#{s[k][0]['startTime']} - #{s[k][0]['endTime']}"
            end
          end
          #add these attributes to sections with the classNumber as the key
          sections[s['classNumber']] = attributes
        end
        all_sections[c['course']['catalogNumber']] = sections
      end
      @@scraped_sections = all_sections
  else
    nil
    end
  end

  def self.get_scraped_courses
    @@scraped_courses
  end

  def self.get_scraped_sections
    @@scraped_sections
  end

  def self.set_empty_chosen_course
    @@chosen_course = Hash.new
    @@chosen_course['catalogNumber'] = ''

    @@course_keys.each do |attribute|
      @@chosen_course[attribute] = ''
    end

  end

  def self.set_chosen_course(key)
    # Find a scraped course with the given key
    @@chosen_course = @@scraped_courses[key]
    @@chosen_course['catalogNumber'] = key
  end

  def self.set_empty_chosen_section
    @@chosen_section = Hash.new
    @@chosen_section['classNumber'] = ''

    @@section_keys.each do |attribute|
      @@chosen_section[attribute] = ''
    end
  end

  def self.set_chosen_section(key)
    @@chosen_section = @@scraped_sections[key]
    @@chosen_section['classNumber'] = key
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

  def self.get_database_section_keys
    @@database_section_keys
  end

end

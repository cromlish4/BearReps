#require_relative '~/BearReps/project3/app/helpers/scraper.rb'
require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# generate 20 users
# # Via - https://dev.to/debosthefirst/how-to-seed-your-rails-database-with-faker-1be3
GEN_NUM = 20

User.destroy_all
User.create!(

  # each user is assigned an id from 1-20
  # id: GEN_NUM + 1,
  fname: "Brutus",
  email: "buckeye.1@osu.edu",
  lname: "Buckeye",
  nameDotNumber: "buckeye.1",
  year: %w[Freshman, Sophomore Junior Senior].sample,
  # issue each user the same password
  password: "password",
  # a user can have only one of these roles
  user_type: "admin",
  verified: "true"
)
User.create!(

  # each user is assigned an id from 1-20
  # id: GEN_NUM + 2,
  fname: "Developer",
  email: "buckeye.2@osu.edu",
  lname: "Buckeye",
  nameDotNumber: "buckeye.2",
  year: %w[Freshman Sophomore Junior Senior].sample,
  # issue each user the same password
  password: "password!",
  # a user can have only one of these roles
  user_type: "dev",
  verified: "true"
)
(1..GEN_NUM).each do |id|

  User.create!(

    # each user is assigned an id from 1-20
    # id: id,
    fname: Faker::Name.first_name,
    email: Faker::Internet.email,
    lname: Faker::Name.last_name,
    nameDotNumber: Faker::Name.last_name,
    year: %w[Freshman Sophomore Junior Senior].sample,
    # issue each user the same password
    password: "password",
    # a user can have only one of these roles
    user_type: %w[student admin teacher].sample,
    verified: %w[true false].sample
  )
end


# courses = Scraper.scrape('cse 3901', Scraper.get_terms, Scraper.get_campuses)

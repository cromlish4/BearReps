# README


Things you may want to cover:


* System dependencies

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

Web Scraping and Login
-----------------------
This project is directly tied to project 4 in the sense that the database, routes, and MVC of our 
Ruby on Rails will be used for project 4. This project scrapes the course listing off of OSU's website
and allows users to view the courses with a variety of permissions. This project allows for users of
students, instructors, and admins, in hope to, eventually, use as a program to assign graders to a 
class.

Motivation
-------------
This project is intended to combine our knowledge of Object Oriented Programming in the Ruby langauge
with Rails in order to create a MVC framework. With this project being a foundation for project 4, this
project was also intended for our group to work efficiently such that we would make project 4 easier on
ourselves.

Features
-----------
Our project was implemented using the MVC framework of Ruby on Rails, particularly using ruby v 2.7.1 and rails v 6.0.3.5. 
With the use of gems, we were able to utilize the convenience of Ruby on Rails in the following ways:
1) rails                      -- for the MVC framework
2) sqlite3                    -- for database management
3) puma                       -- for the application server
4) sass-rails                 -- for SCSS stylesheets
5) webpacker                  -- to transpile app-like Javascript
6) turbolinks                 -- to make navigating web application faster
7) jbuilder                   -- to build JSON APIs with ease
8) bootsnap                   -- to reduce boot times through caching
9) mechanize                  -- for issuing HTTP requests
10) nokogiri                  -- to navigate the body of the response
11) devise                    -- to establish an authorication system
12) byebug                    -- to stop execution and get a debugger console
13) web-console               -- to access an interactive console on exception pages
14) listen                    -- to notify changes in the file system
15) spring                    -- to speed up development by keeping application running in background
16) spring-watcher-listener   -- to listen to application running in background
17) capybara                  -- to add support for Capybara system testing
18) selenium-webdriver        -- to add support for selenium driver
19) webdrivers                -- for easy installation and use of web drivers to run system tests with browsers
20) tzinfo-data               -- to include zoneinfo files, since Windows does not

Screenshots
----------
--Fill in Later--

Installation
-------------
After fethcing our project, you first will want to run "bundle install" on your command line.
Next, you must make sure to enter "rails db:migrate" on your command line in order that your schema.rb will be updated.
Finally, you may enter "rails s" on your command line to run our server. 
Now, you may open up your choice of web browser and enter "localhost:3000" in the url field.

Tests
------

-- Get thoughts from team later --


Acknowledgement
---------

Thanks to Michael Cromlish for being the project lead this project. Michael did the initial setup for the Ruby on Rails project.
He also helped in every aspect of the project and scheduled multiple team meetings to make sure the team was staying on good pace.

Andrew Connors implemented the multiple views and their styling in our project, as well as set up / did troubleshooting on our database tables.

Zhuo Chen worked with the web scraper to ensure we were collecting all necessary data from OSU's course listing.

Samiul islam worked with the web scraper to ensure we were collecting all necessary data from OSU's course listing,
as well as debugging / troubleshooting any errors we ran into with the scraper. 

Eric Young implemented the multiple views and their styling in our project, as well as setting up correct routes and controllers for various users.

Ryan O'Donovan implemented the login system with the use of the Devise gem, and implemented three different user permissions based on student, instructor
and admin. 

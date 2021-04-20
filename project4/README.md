# README


RAILS Final Project
-----------------------
This is our final project for CSE 3901. This project is intended to build upon our progress in project 3. The goal of this project is to implement
a system for students to apply to be graders for courses, an instructor to assign recommendations for student graders, and an admin to 
scrape the course listing of OSU CSE's courses.

Motivation
-------------
This project is intended to combine our knowledge of Object Oriented Programming in the Ruby langauge
with Rails in order to create a MVC framework. With this project expanding on the foundation from project 3, this
project was also intended for our group to work efficiently such that we would expand project 3 to implement
a grader application / recommendation system as well as a fully-functional admin system. 

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
12) faker                     -- to generate fake data( ie used for 20 accounts to populate db)
13) byebug                    -- to stop execution and get a debugger console
14) web-console               -- to access an interactive console on exception pages
15) listen                    -- to notify changes in the file system
16) spring                    -- to speed up development by keeping application running in background
17) spring-watcher-listener   -- to listen to application running in background
18) capybara                  -- to add support for Capybara system testing
19) selenium-webdriver        -- to add support for selenium driver
20) webdrivers                -- for easy installation and use of web drivers to run system tests with browsers
21) tzinfo-data               -- to include zoneinfo files, since Windows does not

This final project is heavily based on a web scraper to get all the course listings from OSU's CSE catalog. Prominent featues of this Scraper include:

1)


This project heavily utilized databases for keeping track of users of types student, intstructor, and admin. Additonally, to keep track of applications and reocmmendations for student graders based on a class. Promiment features of our databses include:

1)


Screenshots
----------
1) Home Page -- user not signed in
![Home page new user](https://user-images.githubusercontent.com/77806397/112222900-89d08e80-8bff-11eb-94ae-74abb8ae325e.PNG)

2) Home Page -- user signed in, but not verified
![Home page signed in not verified](https://user-images.githubusercontent.com/77806397/112222020-8f79a480-8bfe-11eb-8eaa-8177dba0592c.PNG)

3) Home Page -- user signed out
![Home page not signed in](https://user-images.githubusercontent.com/77806397/112221980-8092f200-8bfe-11eb-92e5-5bbf893c3f96.PNG)

4) Verify Page -- Admin signed in
![Verify admin signed in](https://user-images.githubusercontent.com/77364977/112228320-8214e800-8c07-11eb-9c6d-04731ead5833.png)

Installation
-------------
After fethcing our project, you first will want to run "bundle install" on your command line.
Next, you must make sure to enter "rails db:migrate" on your command line in order that your schema.rb will be updated.
You will also want to enter "rails db:seed" on your command line in order to get a default, verified admin account in order to see all of our views.
Finally, you may enter "rails s" on your command line to run our server. 
Now, you may open up your choice of web browser and enter "localhost:3000" in the url field.

Notes: There are two default accounts Admin Email: buckeye.1@osu.edu Password: password and Developer Email: buckeye.2@osu.edu Password: password
Running Scraper By Itself
--------------------------
In the case where you might need to run scraper separately you can find it in app/helpers/scraper.rb

To run this from the command line just "cd app/helpers/" then run "ruby scraper.rb"

Enter your search query. Then when it asks for a term decide if you want summer, spring or autumn and select the corresponding number (example, if you want summer type in 1214).
Then follow the same procedure for when it asks you to enter a campus (example, columbus is col).

The program will now scrape through the osu courses and return to you the catalog number, title, term, units and campus.

![Home page new user](https://i.imgur.com/suSf2YL.png)

Tests
------

1) We made sure that in the CoursesController for both New and Create, that these may only be entered if the user is a verified admin. Otherwise, we redirect to the index page.


2) We made sure that in the ScrapesController for both New and Create, that these may only be entered if the user is a verified admin. Otherwise, we redirect to the index page.

3) For the ApplicationController and Home page, we made sure that if the user is not signed in, then they are not able to view the development links, and only the Sign Up, Login, and Search Courses link

4) For grading, we made sure to add a default, verified admin account with the use of rails seeds.


Acknowledgement
---------

Thanks to Andrew Connors for being the project lead this project. Andrew did the initial setup for the Ruby on Rails project.
He also helped in every aspect of the project and scheduled multiple team meetings to make sure the team was staying on good pace.

Michael Cromlish implemented the admin MVC, as well as verification in order to implement the admin functionality as a whole for this project. 

Zhuo Chen worked with styling of multiple HTML forms for this project.

Samiul islam worked with the web scraper to ensure we were collecting all necessary data from OSU's course listing,
as well as debugging / troubleshooting any errors we ran into with the scraper. Samiul also worked with the databses for courses and sections
to provide an overall functionality for our course listing.

Eric Young implemented the application portion of this project in order for a student to apply for a grading position.

Ryan O'Donovan implemented the recommendation portion of this project in order for a teacher to submit a recommendation for a student grader, provided additonal help 
with the application portion, and created the README for project 4.

References
----------
- README guidelines:
    -  makeareadme.com 
    -  "A Beginners Guide to writing a Kickass READMe" by Akash Nimare

- Course Searching
    - https://medium.com/@yassimortensen/simple-search-form-in-rails-8483739e4042
 - Some Scraping
     - https://stackoverflow.com/questions/12047100/ruby-mechanize-nokogiri-and-nethttp

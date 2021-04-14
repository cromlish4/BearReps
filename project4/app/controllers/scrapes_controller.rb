class ScrapesController < ApplicationController

  #require 'app/helpers/scraper'

  def index
    @campus = campus_value(params[:campus_value])
    @term = set_search_term_value(params[:term_value])
    search_results = search(params[:search])
    @scraped_courses = Scrape.extract_courses(search_results)
  end

  def new
    if not Scrape.get_chosen_course
      Scrape.set_empty_chosen_course
    end
    @course = Course.new
  end

  def show
    if Scrape.get_scraped_courses
      @course = Scrape.get_scraped_courses[params[:key]]
      if not @course
        render 'index'
      end
    else
      render 'index'
    end
  end

  def create
    @course = Course.new(my_params_course)
    if @course.save
      redirect_to @course
    else
      render :new
    end
  end

  private def search(search)
    #if there was a search query
    if search
      Scrape.scrape(search, @term, @campus)
    else
      nil
    end
  end

  #the two methods below check to make sure that term and title are things in the database
  private def set_search_term_value(term)
    if term
      term.downcase!
      if Scrape.get_terms.key?(term)
        Scrape.get_terms[term]
      else
        Scrape.get_terms['autumn']
      end
    else
      Scrape.get_terms['autumn']
    end
  end

  private def campus_value(campus)
    if campus
      campus.downcase!
      if Scrape.get_campuses.key?(campus)
        Scrape.get_campuses[campus]
      else
        Scrape.get_campuses['columbus']
      end
    else
      Scrape.get_campuses['columbus']
    end
  end
end

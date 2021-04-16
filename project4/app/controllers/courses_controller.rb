# Via - https://web.archive.org/web/20190322155638/http://it.anar8.ru:80/312
class CoursesController < ApplicationController

  def index
    @title = title_value(params[:title_value])
    @term = set_search_term_value(params[:term_value])
    @courses = search(params[:search]).order(catalog_number: :ASC)
  end

  def show
    @course = Course.find(params[:id])
    @sections = get_matching_sections(params[:id].to_i)
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(my_params_course)
    if @course.save
      redirect_to @course
    else
      render :'scrapes/new'
    end
  end

  private def search(search)
    #if there was a search query
    if search
      #take all fields and use them to narrow down matches
      list = Course.where("catalog_number like ?", "%#{search}%")
      list = list.where("term like ?", "%#{@term}%")
      list.where("title like ?", "%#{@title}%")
    else
      Course.all
    end
  end

  private def get_matching_sections(course_id)
    if course_id > 0
      list = Section.where("courseID = ?", course_id)
    end
  end

  #the two methods below check to make sure that term and title are things in the database
  private def set_search_term_value(term)
    nil
    if term and term != ""
      #check if there is a course with this term
      courses = Course.where("term like ?", "%#{term}%")
      if not courses.blank?
        term
      else
        nil
      end
    end
  end

  private def title_value(title)
    nil
    if title and title != ""
      #check if there is a course with this title
      courses = Course.where("title like ?", "%#{title}%")
      if not courses.blank?
        title
      else
        nil
      end
    end
  end

end
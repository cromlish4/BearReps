# Via - https://web.archive.org/web/20190322155638/http://it.anar8.ru:80/312
class CoursesController < ApplicationController

  def index
    #@courses = Course.all.order("catalog_number DESC")
    @title = set_search_title_value(params[:set_search_title_value])
    @term = set_search_term_value(params[:set_search_term_value])
    @courses = search(params[:search])
  end

  def show
    @course = Course.find(params[:id])
  end

  def new
    @course = Course.new
  end

  def search
    @course = Course.new
  end

  def create
    @course = Course.new(my_params)
    if @course.save

      redirect_to @course
    else
      render :new
    end
  end

  private def my_params
    params.require(:course).permit(:title, :term, :units, :campus, :subject, :catalog_number)
  end

  private def search(search)
    if search
      list = Course.where("catalog_number like ?", "%#{search}%")
      list = list.where("term like ?", "%#{@term}%")
      list.where("title like ?", "%#{@title}%")
    else
      Course.all
    end
  end

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

  private def set_search_title_value(title)
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
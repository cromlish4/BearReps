# Via - https://web.archive.org/web/20190322155638/http://it.anar8.ru:80/312
class CoursesController < ApplicationController

  def index
    @title = title_value(params[:title_value])
    @term = set_search_term_value(params[:term_value])
    @courses = search(params[:search]).order(catalog_number: :ASC)
  end

  def show
    #TODO check again after sections is done
    @course = Course.find(params[:id])
    @sections = get_matching_sections(@course.id)
  end

  def new
    @course = Course.new
  end

  def edit
    #TODO
    @old_course = Course.where("ROWID = ?", params[:id])
    @course = Course.new
  end

  def destroy
    course = Course.find(params[:id])
    course.destroy
    sections = Section.find_by_courseID(params[:id])

    if sections
      sections.each do |sect|
        sect.destroy
      end
    end

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed" }
      format.json { head :no_content }
    end
  end

  def check_course_duplicate(params)
    possible_dupe = Course.find_by(:catalog_number => params[:catalog_number], :campus => params[:campus], :term => params[:term])
    if possible_dupe
      found = true
    else
      found = false
    end
  end

  def create
    #check for duplicates
    if !check_course_duplicate(my_params_course)
      @course = Course.new(my_params_course)
      if @course.save
        redirect_to @course
      else
        redirect_to :home, notice: "ERROR SAVING!"
      end
    else
      redirect_to :courses, notice: "DUPLICATE COURSE"
    end
  end

  private def search(search)
    #if there was a search query
    if search
      #take all fields and use them to narrow down matches
      list = Course.where("catalog_number like ?", "%#{search}%")
      list = list.where("UPPER(term) like UPPER(?)", "%#{@term}%")
      list.where("UPPER(title) like UPPER(?)", "%#{@title}%")
    else
      Course.all
    end
  end

  private def get_matching_sections(course_id)
    if course_id
      list = Section.find_by_courseID(course_id)
    end
  end

  #the two methods below check to make sure that term and title are things in the database
  private def set_search_term_value(term)
    nil
    if term and term != ""
      #check if there is a course with this term
      courses = Course.where("UPPER(term) like UPPER(?)", "%#{term}%")
      if not courses.blank?
        term
      else
        flash[:notice] = "No such term in database"
        nil
      end
    end
  end

  private def title_value(title)
    nil
    if title and title != ""
      #check if there is a course with this title
      courses = Course.where("UPPER(title) like UPPER(?)", "%#{title}%")
      if not courses.blank?
        title
      else
        flash[:notice] = "No such title in database"
        nil
      end
    end
  end

end

# Via - https://web.archive.org/web/20190322155638/http://it.anar8.ru:80/312
class CoursesController < ApplicationController

    def index
      @course = Course.all
    end

    def new
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

  private

  def my_params
    params.require(:course).permit(:title, :term, :units, :campus, :subject, :catalog_number)
  end

end

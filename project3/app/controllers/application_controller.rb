class ApplicationController < ActionController::Base
  private def my_params_course
    params.require(:course).permit(:title, :term, :units, :campus, :subject, :catalog_number)
  end
end

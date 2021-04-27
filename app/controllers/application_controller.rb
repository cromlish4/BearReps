class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:fname, :lname, :nameDotNumber, :year, :user_type])
    devise_parameter_sanitizer.permit(:account_update, keys: [:fname, :lname, :nameDotNumber, :year, :user_type])
  end

  private def my_params_course
    params.require(:course).permit(:title, :term, :units, :campus, :subject, :catalog_number, :specID)
  end
end

class PagesController < ApplicationController
  def login

  end
  def new_profile

  end
  def display_course

  end
  def display_profile

  end
  def home

  end

  def status
    @userApp = App.find_by(nameDotNumber: current_user.nameDotNumber)

  end


end

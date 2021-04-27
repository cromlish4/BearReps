class AppsController < ApplicationController
# note here Applications (plural)!

# use before_action to reduce code duplication
skip_before_action :verify_authenticity_token
before_action :set_application, only: [:show, :edit, :update, :destroy]

# wired to app/views/apps/index.html.erb by default (naming convention)
def index
  @applications = App.all # be carefult about singular and plural
end

# wired to app/views/apps/show.html.erb by default (naming convention)
# display an application (if the application doesn't exist, redirect to the page for all the apps)
def show
  @application = App.find(params[:id])
  if @application.nil?
    redirect_to action: :index
  end
end

# wired to app/views/apps/new.html.erb by default (naming convention)
# that view GET a blank form for creating a new application, submitting with POST
def new
  @application = App.new
end

#def application_params
#     params.require(:section).permit(:classNumber, :meetingDays, :meetingTimes, :waitlistTotal, :courseID, :endDate, :startDate, :enrollmentStatus, :instructionMode, :component, :section)
#   end

# POST a newly filled form to create a new application
def create
  possible_dupe = Course.find_by(:catalog_number => params[:app][:course])
  if possible_dupe
    found = true
  else
    found = false
  end
  if found
    @application = App.new()
    @application.nameDotNumber = params[:app][:nameDotNumber]
    @application.comments = params[:app][:comments]
    @application.email = params[:app][:email]
    @application.course = params[:app][:course]

    #@application. = Student.find_or_create_by(nameDotNumber: params[:current_user])
    # the applicant's name is contained in the parameter hash which is passed to the controller when the applicant submits the form with their name
    # for example, if the applicant's name is Bob in the application, params[:applicant] = "Bob"
    # then find_or_create_by(name: "Bob") will search the students table for "Bob" and return the instance if it is found
    # otherwise a new row with "Bob" as the name attribute will be created in the students table
    # @application.section = Section.find_by(params[:app][:nameDotNumber])
    # link the application with the section written on it
    # the find_by! is like find_by except that if no record is found, raises an ActiveRecord::RecordNotFound error
    if @application.save
      redirect_to @application, notice: "Successfully Saved!"
    else
      render new
   end
      else
    redirect_to home_url
    flash.alert = "No sections available!"
    # end
end
end

# wired to app/views/apps/update.html.erb by default (naming convention)
# that view GET a filled form for updating an application, submitting with PUT
def update
  @application_to_update = App.find(params[:id])
  @application_to_update.update(:nameDotNumber => params[:app][:nameDotNumber])
  @application_to_update.update(:comments => params[:app][:comments])
  @application_to_update.update(:instr_comments => params[:app][:instr_comments])
  @application_to_update.update(:email => params[:app][:email])
  @application_to_update.update(:course => params[:app][:course])
  @application_to_update.save
  redirect_to home_url
end

# PUT the edited form to update an application
#def update
  # if @application.update()
  #   redirect_to @application, notice: "Successfully Updated!"
  # else
  #   render edit
  # end
#@grader_to_update = App.find_by(:nameDotNumber => params[:nameDotNumber])

# @grader_to_update.update(:employed_status => params[:app][:employed_status])

  # @section_to_update.update(:grader => params[:section][:grader])

#@grader_to_update.save
#redirect_to "/admin/app_graders/show?nameDotNumber=#{current_user.nameDotNumber}"
#end


# wired to app/views/apps/destroy.html.erb by default (naming convention)
def destroy
  @application.destroy
  redirect_to action: :index, notice: "Successfully deleted!"  # use redirect instead of render to avoid double submission (double deletion)
end



def approve
  temp_app = App.find(params[:id])
  temp_app.update(:approved => "true")
  temp_app.save
  redirect_to :controller => 'apps', :action => 'index'
end

private
  # the snippet below is shared by show, edit, update, destroy
  def set_application
    @application = App.find(params[:id])
  end


end

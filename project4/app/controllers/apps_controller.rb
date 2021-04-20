class AppsController < ApplicationController
# note here Applications (plural)!

# use before_action to reduce code duplication
before_action :set_application, only: [:show, :edit, :update, :destroy]

# wired to app/views/apps/index.html.erb by default (naming convention)
def index
  @applications = App.all # be carefult about singular and plural
end

# wired to app/views/apps/show.html.erb by default (naming convention)
# display an application (if the application doesn't exist, redirect to the page for all the apps)
def show
  if @application.nil?
    redirect_to action: :index
  end
end

# wired to app/views/apps/new.html.erb by default (naming convention)
# that view GET a blank form for creating a new application, submitting with POST
def new
  @application = App.new
end

# POST a newly filled form to create a new application
def create
  @application = App.new(params[:id])
  @application.owner = Student.find_or_create_by(name: params[:applicant])
  # the applicant's name is contained in the parameter hash which is passed to the controller when the applicant submits the form with their name
  # for example, if the applicant's name is Bob in the application, params[:applicant] = "Bob"
  # then find_or_create_by(name: "Bob") will search the students table for "Bob" and return the instance if it is found
  # otherwise a new row with "Bob" as the name attribute will be created in the students table
  @application.section = Section.find_by!(classNumber: params[:section])
  # link the application with the section written on it
  # the find_by! is like find_by except that if no record is found, raises an ActiveRecord::RecordNotFound error
  if @application.save
    redirect_to @application, notice: "Successfully Saved!"
  else
    render new
  end
end

# wired to app/views/apps/update.html.erb by default (naming convention)
# that view GET a filled form for updating an application, submitting with PUT
def edit
end

# PUT the edited form to update an application
def update
  # if @application.update()
  #   redirect_to @application, notice: "Successfully Updated!"
  # else
  #   render edit
  # end
  @grader_to_update = App.find_by(:nameDotNumber => params[:nameDotNumber])

  @grader_to_update.update(:employed_status => params[:app][:employed_status])

  # @section_to_update.update(:grader => params[:section][:grader])

  @grader_to_update.save
  redirect_to "/admin/app_graders/show?nameDotNumber="+params[:nameDotNumber]
end


# wired to app/views/apps/destroy.html.erb by default (naming convention)
def destroy
  @application.destroy
  redirect_to action: :index, notice: "Successfully deleted!"  # use redirect instead of render to avoid double submission (double deletion)
end


private
  # the snippet below is shared by show, edit, update, destroy
  def set_application
    @application = App.find(params[:id])
  end


end

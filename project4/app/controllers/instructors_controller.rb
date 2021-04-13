class InstructorsController < ApplicationController
# use before_action to reduce code duplication
before_action :set_instructor, only: [:show, :edit, :update, :destroy]

# wired to app/views/instructors/index.html.erb by default (naming convention)
def index
  @instructors = User.where(user_type: "") # be careful about singular and plural
  @admin = User.where(user_type: "admin")
end

# wired to app/views/instructors/show.html.erb by default (naming convention)
def show
  if @instructor.nil?
    redirect_to action: :index
  end
end

# wired to app/views/instructors/new.html.erb by default (naming convention)
# that view GET a blank form for creating a new instructor, submitting with POST
def new
  @instructor = User.new
  # Add proper data to this
end

# POST a newly filled form to create a new instructor
def create
  @instructor = User.new(params[:id])
  # Add proper Data here as well
  if @instructor.save
    redirect_to @instructor, notice: "Successfully Saved!"
  else
    render :new
  end
end

# wired to app/views/instructors/update.html.erb by default (naming convention)
# that view GET a filled form for updating an instructor, submitting with PUT
def edit
end

# PUT the edited form to update an instructor
def update
  # Add proper data to this
  if @instructor.update
    redirect_to @instructor, notice: "Successfully Updated!"
  else
    render :edit
  end
end


# wired to app/views/instructors/destroy.html.erb by default (naming convention)
def destroy
  @instructor.destroy
  redirect_to action: :index, notice: "Successfully deleted!"  # use redirect instead of render to avoid double submission (double deletion)
end


private
  # the snippet below is shared by show, edit, update, destroy
  def set_instructor
    @instructor = User.find(params[:id])
  end

end

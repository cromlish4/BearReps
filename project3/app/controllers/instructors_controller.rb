class InstructorsController < ApplicationController
# use before_action to reduce code duplication
before_action :set_instructor, only: [:show, :edit, :update, :destroy]

# wired to app/views/instructors/index.html.erb by default (naming convention)
def index
  @instructors = Instructor.all # be careful about singular and plural
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
  @instructor = Instructor.new
end

# POST a newly filled form to create a new instructor
def create
  @instructor = Instructor.new
  if @instructor.save
    redirect_to @instructor, notice: "Successfully Saved!"
  else
    render :new
  end
end

# wired to app/views/instructors/update.html.erb by default (naming convention)
# that view GET a filled form for updating a new instructor, submitting with PUT
def edit
end

# PUT the edited form to update a new instructor
def update
  @instructor = Instructor.new
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
    @instructor = Instructor.find(params[:name])
  end

end

class RecommendationsController < ApplicationController
  # use before_action to reduce code duplication
  before_action :set_application, only: [:show, :edit, :update, :destroy]


  def index
    @recommendations = Recommendation.all # be careful about singular and plural
  end


  # wired to app/views/recommendations/show.html.erb by default (naming convention)
  # display a recommendation (if the application doesn't exist, redirect to the page for all the apps)
  def show
    if @recommendation.nil?
      redirect_to action: :index
    end
  end

  # wired to app/views/recommendations/new.html.erb by default (naming convention)
  # that view GET a blank form for creating a new recommendation, submitting with POST
  def new
    @recommendation = Application.new
  end
end

# POST a newly filled form to create a new recommendation
def create
  @recommendation = Recommendation.new(params[:id])
  @recommendation.owner = Instructor.find_or_create_by(name: params[:applicant])  # TODO: the "name:" here may need to be adjusted to the correct attribute that specifies the student's name in the student model for the database
  # the applicant's name is contained in the parameter hash which is passed to the controller when the applicant submits the form with their name
  # Student.find(params[:name]) makes use of the applicant's name and links the form with the student with that name
  if @recommendation.save
    redirect_to @recommendation, notice: "Successfully Saved!"
  else
    render new
  end

  # wired to app/views/recommendations/update.html.erb by default (naming convention)
  # that view GET a filled form for updating an recommendation, submitting with PUT
  def edit
  end

  # PUT the edited form to update a recommendation
  def update
    if @recommendation.update
      redirect_to @recommendation, notice: "Successfully Updated!"
    else
      render edit
    end
  end

  # wired to app/views/recommendations/destroy.html.erb by default (naming convention)
  def destroy
    @recommendation.destroy
    redirect_to action: :index, notice: "Successfully deleted!"  # use redirect instead of render to avoid double submission (double deletion)
  end

  private
  # the snippet below is shared by show, edit, update, destroy
  def set_application
    @application = Application.find(params[:id])
  end

end

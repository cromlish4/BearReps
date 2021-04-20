class RecommendationsController < ApplicationController
  # use before_action to reduce code duplication
  before_action :set_application, only: [:show, :edit, :update, :destroy]


  def index
    @recommendations = Recommendation.all # be careful about singular and plural
  end


  # wired to app/views/recommendations/show.html.erb by default (naming convention)
  # display a recommendation (if the application doesn't exist, redirect to the page for all the apps)
  def show
    @recommendation = Recommendation.find(params[:id])
    if @recommendation.nil?
      redirect_to action: :index
    end
  end

  # wired to app/views/recommendations/new.html.erb by default (naming convention)
  # that view GET a blank form for creating a new recommendation, submitting with POST
  def new
    @recommendation = Recommendation.new
  end


# POST a newly filled form to create a new recommendation
def create
  if true
  @recommendation = Recommendation.new()
  @recommendation.nameDotNumber = params[:app][:comments]
  @recommendation.course = params[:app][:course]

  if @recommendation.save
    redirect_to @recommendation, notice: "Successfully Saved!"
  else
    render new
  end
  else
    redirect_to home_url
    flash.alert = "No Recommendations available!"

  end
  end

  # wired to app/views/recommendations/update.html.erb by default (naming convention)
  # that view GET a filled form for updating an recommendation, submitting with PUT
  def edit
  end

  # PUT the edited form to update a recommendation
  def update
    @recommendation_to_update = Recommendation.find(params[:id])
    @recommendation_to_update.update(:nameDotNumber => params[:app][:nameDotNumber])
    @recommendation_to_update.update(:course => params[:app][:course])
    @recommendation_to_update.save

    redirect_to home_url

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

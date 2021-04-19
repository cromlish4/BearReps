class AdminRecommendationController < ApplicationController
  def edit
    @Recommendations = Recommendation.find(params[:id])
  end
  def show
    @Recommendations = Recommendation.find(params[:id])
  end
end

class AdminGraderController < ApplicationController
  def edit
    @Sections = Section.find(params[:id])
  end
  def show
    @Sections = Section.find(params[:id])
  end
  def update
    redirect_to "/admin/graders/show?id="+params[:id]
  end
  # def index
  #   # params[:user][:year]
  #   @User_to_update = User.find_by(:nameDotNumber => params[:nameNum])
  #   @User_to_update.update(:year => params[:user][:year])
  #   @User_to_update.update(:fname => params[:user][:fname])
  #   # @User_to_update.update(:nameDotNumber => params[:user][:nameDotNumber])
  #   @User_to_update.update(:lname => params[:user][:lname])
  #   if params["Verified"]=="1"
  #     @User_to_update.update(:verified => "true")
  #   else
  #     @User_to_update.update(:verified => "false")
  #   end
  #   @User_to_update.update(:user_type => params[:user]["User Type"])
  #   @User_to_update.save
  #   redirect_to "/admin/graders/show?nameDotNumber="+params[:nameNum]
  # end
end

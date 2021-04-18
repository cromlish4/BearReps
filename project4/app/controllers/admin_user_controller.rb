class AdminUserController < ApplicationController
  def edit
    @Users = User.find_by(nameDotNumber: params[:nameDotNumber])
  end
  def show
    @Users = User.find_by(nameDotNumber: params[:nameDotNumber])
  end
  def update

  end
  # Patch for updating user
  def index
    # @admin_edit
    # str_year = params[:users][:year]
    # {"_method"=>"patch",
    #  "authenticity_token"=>"8RIXihsxo3Bb3XDVa9LkkHyMIFJnNlt2AjkXHYspyFPj2hthJ0H348pMWqpQ/PtpoM8XJw52EA+v+vCWbgB2mA==",
    #  "user"=>{"year"=>"Junior", "User Type"=>"admin"},
    #  "Verified"=>"1",
    #  "nameNum"=>"buckeye.1",
    #  "commit"=>"Update Entry",
    #  "format"=>"21"}

    # params[:user][:year]
    @User_to_update = User.find_by(:nameDotNumber => params[:nameNum])
    @User_to_update.update(:year => params[:user][:year])
    @User_to_update.update(:fname => params[:user][:fname])
    # @User_to_update.update(:nameDotNumber => params[:user][:nameDotNumber])
    @User_to_update.update(:lname => params[:user][:lname])
    if params["Verified"]=="1"
      @User_to_update.update(:verified => "true")
    else
      @User_to_update.update(:verified => "false")
    end
    @User_to_update.update(:user_type => params[:user]["User Type"])
    @User_to_update.save
    redirect_to "/admin/users/show?nameDotNumber="+params[:nameNum]
  end
end

class AdminsController < ApplicationController

  before_action :set_admin, only: [ :show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  @admin = User.where(user_type: "admin")

  def index
  @admin = User.where(user_type: "admin")
  end

  def show
    if @admin.nil?
      redirect_to "/admins_index"
    end
  end

  #GET /admins/new
  #def new
  #  @admin = Admin.new
  #end


  #POST admin form filled out by user
  def create
    @admin = User.new
    if @admin.save
      redirect_to @admin, notice: "Saved new admin entry"
    else
      render :new
    end
  end

  def edit
    # @admin = User.find_by(nameDotNumber: params[:nameDotNumber])
    @admin = current_user
  end

  #PUT the form with the new admin info
  def update
    @admin = User.new
    if @admin.update
      redirect_to @admin, notice: "Successfully updated admin entry"
    else
      render :edit
    end
  end

  def destroy
    @admin.destroy
    #Redirect to show all the admins after deletion
    redirect_to action: :index, notice: "Deleted selected admin entry"
  end

  def verify_redirect
    temp_user = User.find_by(nameDotNumber: params[:nameDotNumber])
    temp_user.verified = "true"
    temp_user.save
  end

  def admin_home

  end

  def verify
    @unverified_users = User.order(sort_column + " " + sort_direction)
  end

  def verify_account

  end

  def users
    @show_users = User.order(sort_column + " " + sort_direction)

    if params[:search]
      search_users
    end
  end

  private

  def set_admin
    @admin = User.find_by(nameDotNumber: params[:nameDotNumber])
  end

  def sort_column
    User.column_names.include?(params[:sort]) ? params[:sort] : "lname"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

  def search_users
    if @user = User.all.find{|user| user.lname.include?(params[:search]) || user.fname.include?(params[:search])}
      redirect_to user_path(@user)
    end
  end
end

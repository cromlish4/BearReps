class AdminsController < ApplicationController
  before_action :authenticate_user!
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


    if params[:search]!=""
      @show_users = search_users(User)
    else
      @show_users = User
    end
    #redirect_to admin_users_path
    #redirect_to admin_users_path
  end

  def users_show
    @Users = User.where(nameDotNumber: params[:nameDotNumber])
  end

  def users_edit
    @edit_users = User.where(nameDotNumber: params[:nameDotNumber])
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
  # Via https://medium.com/swlh/using-rails-and-html-to-view-sort-and-search-tables-fbf8a0543558
  def search_users(db)
    return db.where(fname: params[:search]).or(db.where(lname: params[:search]))

  end
end

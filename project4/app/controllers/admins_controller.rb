class AdminsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_admin, only: [ :show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction
  @admin = User.where(user_type: "admin")
  @admin_edit
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
    @unverified_users = User.order(sort_column(User) + " " + sort_direction)
  end

  def verify_account

  end

  def users
    @show_users = User.order(sort_column(User) + " " + sort_direction)


    if params[:search]!=""
      @show_users = search_db(User)
    else
      @show_users = User
    end
    #redirect_to admin_users_path
    #redirect_to admin_users_path
  end

  def users_show
    @Users = User.where(nameDotNumber: params[:nameDotNumber])
  end

  # Patch for updating user
  # def user_show
  #   # @admin_edit
  #   str_year = params[:users][:year]
  #
  #   redirect_to "/admin/users/show?nameDotNumber="+str_year
  #   #params[:nameNum]
  # end

  def scrape_show

  end
  # page for routing update to database edit
  def admins_all
    sub_dir = params[:sub_dir]
    # sub_dir is the place that we need to redirect to
    if sub_dir == 'users'
      # Users Edit code to update database
      # This code is here to cause error to see params in rails browser.
      #Data[1].split("/")

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
      if (params[:keep_user] == "false")
        @User_to_update.update(:user_type => params[:user]["User Type"])
      end
      @User_to_update.save
      redirect_to "/admin/users/show?nameDotNumber="+params[:nameNum]
    elsif sub_dir == 'graders'
      # Graders Edit code to update database
      # This section never happens since the section update goes to the section controller but I'm unsure how to change that
      # so I'm leaving this here just in case MSC
      #Data[1].split("/")

    end
  end

  def users_edit
    @edit_users = User.find_by(nameDotNumber: params[:nameDotNumber])

  end

  #Graders
    def graders
      #@show_sections = Section.order(sort_column(Section) + " " + sort_direction)

      #Data[1].split("/")

      if params[:search]!=""
        @show_sections = Section.where(courseID: search_sections.ids)
      else
        @show_sections = Section
      end
      #redirect_to admin_users_path
      #redirect_to admin_users_path
    end

  private

  def set_admin
    @admin = User.find_by(nameDotNumber: params[:nameDotNumber])
  end

  def sort_column(db)
    db.column_names.include?(params[:sort]) ? params[:sort] : "lname"
  end
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  # Via https://medium.com/swlh/using-rails-and-html-to-view-sort-and-search-tables-fbf8a0543558
  def search_db(db)
    return db.where(fname: params[:search]).or(db.where(lname: params[:search]))

  end
  def search_sections
    return Course.where(catalog_number: params[:search])
  end
end

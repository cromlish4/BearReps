class AdminsController < ApplicationController
before_action :set_admin, only: [ :show, :edit, :update, :destroy]

def index
  @admins = Admin.all
end

def show
  if @admin.nil?
    redirect_to action: :index
  end
end

#GET /admins/new
def new
  @admin = Admin.new
end



#POST admin form filled out by user
def create
  @admin = Admin.new
  if @admin.save
    redirect_to @admin, notice: "Saved new admin entry"
  else
    render :new
  end
end

def edit
  @admin = Admin.find(params[:nameDotNumber])
end

#PUT the form with the new admin info
def update
  @admin = Admin.new
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

private

  def set_admin
    @admin = Admin.find(params[:nameDotNumber])
  end
end


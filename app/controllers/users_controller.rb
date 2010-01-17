class UsersController < ApplicationController
  layout "admin"
  before_filter :get_user, :only => [:edit, :update]

  access_control :debug => true do
    actions :index, :show do
      allow "user"
    end
    
    actions :edit, :update do
      allow "user", :if => :user_is_current_user?
    end
    
    allow "admin"
  end
  
  def index
    @users = User.all
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      @user.has_no_roles!
      for role in params[:roles]
        @user.has_role!(role)
      end
      redirect_to users_path
    else
      render :action => :new
    end
  end
  
  def show
    @user = params[:id] ? User.find(params[:id]) : @current_user
  end

  def edit
  end
  
  def update
    if @user.update_attributes(params[:user])
      @user.has_no_roles!
      for role in params[:roles]
        @user.has_role!(role)
      end
      redirect_to users_path
    else
      render :action => :edit
    end
  end
  
  
  protected
  
  def get_user
    @user = User.find(params[:id])
  end
end
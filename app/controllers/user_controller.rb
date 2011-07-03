class UserController < ApplicationController

  def new
    @user = User.new
    @title = "Register"
  end
  
  
  def index
    @title = "Temporary View"
    @users = User.find(:all)
  end

def create
    @user = User.new(params[:user])
    if @user.save
            sign_in @user
      # Handle a successful save.
      flash[:success] = "Welcome to the webshop!"
      redirect_to @user
    else
      @title = "Register"
      render 'new'
    end
  end
  
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User destroyed."
    redirect_to users_path
  end

  def login
  end

  def logout
  end

def admin_login
    session[:login] = 1
    session[:cart] = nil
    flash[:notice] = "Admin user successfully logged in, cart reset."
    redirect_to :controller => :items
  end

  def logout
    session[:login] = nil
    session[:cart] = nil
    flash[:notice] = "User logged out, cart reset."
    redirect_to :controller => :items
  end
end


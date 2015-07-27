class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy] 
  before_action :confirm_logged_in, except: [:new, :attempt_login, :logout, :create]
 
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  def attempt_login
    if params[:username].present? && params[:password].present?
      found_user = User.where(:username => params[:username]).first
          if found_user
              authorized_user = found_user.authenticate(params[:password])
          end
        end

      if authorized_user 
          session[:user_id] = authorized_user.id
          session[:username] = authorized_user.username
          flash[:notice] = "You are now logged in."
        redirect_to(:controller => 'posts', :action => 'new')
      else
          flash[:notice] = "Invalid username/password combination."
          redirect_to(:action => 'new')
      end
    end

  def logout
    session[:user_id] = nil
    session[:username] = nil
    cookies.delete(:secureusertokens)
    flash[:notice] = "Logged out"
    redirect_to(:action => "new")
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    if params[:id].to_i != session[:user_id]
      redirect_to(:controller => 'posts', :action => 'new')
    else
      @user = User.find(params[:id])
   
    end

  end

  def change_password
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    respond_to do |format|
      if @user.save
        session[:user_id] = @user.id
        session[:username] = @user.username
        format.html { redirect_to :controller => 'posts', :action => 'new', notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to :controller => 'posts', :action => 'new', notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end

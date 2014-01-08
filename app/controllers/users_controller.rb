class UsersController < ApplicationController
  #before_action :signed_in_user, only: [:index, :edit, :update, :destroy]
  before_action :correct_user,   only: [:edit, :update]
  before_action :admin_user,     only: :destroy

  

  def show
  	@user = User.find(params[:id])
    
  end

  def new
  	@user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
    	flash[:success] = "Welcome to the Taxistand. Customize your home page here"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def search
    index
    render :index
  end

def index
   @q = User.search(params[:q])
  @users = @q.result(distinct: true)
  
end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted."
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :contact, :vehicle, :location, :quote, :password,
                                   :password_confirmation, :image, :remote_image_url, :q)
    end

    def signed_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in."
      end
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user
    end
    
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end

class UsersController < ApplicationController

  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    @user.is_admin = false
    if @user.save
      flash[:success] = "Create Successful!"
      redirect_to @user
    else
      flash[:faild] = "Create fail!"
      render 'new'
    end
  end

  def index
    @users = User.paginate page: params[:page]
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :is_admin)
    end

    def correct_user
      redirect_to(root_path) unless admin_user?(current_user)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end

end
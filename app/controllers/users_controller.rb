class UsersController < ApplicationController

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

end
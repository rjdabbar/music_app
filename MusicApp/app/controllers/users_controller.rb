class UsersController < ApplicationController
before_action :ensure_user_is_admin, only: :index

  def index
    @users = User.all
  end

  def new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      UserMailer.welcome_email(@user).deliver
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def activate
    @user = User.find_by(activation_token: params[:activation_token])
    if @user
      @user.activate!
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      redirect_to new_user_url
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

  def ensure_user_is_admin
    redirect_to bands_url unless current_user.admin?
  end
end

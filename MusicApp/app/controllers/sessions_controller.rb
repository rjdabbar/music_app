class SessionsController < ApplicationController

  def new
  end

  def create
    @user = User.find_by_credentials(user_params[:email],
                                     user_params[:password])
    if @user && @user.activated?
      sign_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = @user.errros.full_messages
      render :new
    end
  end

  def destroy
    sign_out!
    redirect_to new_session_url
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end

class UserMailer < ApplicationMailer
  default from: "music@appacademy.io"

  def welcome_email(user)
    @user = user
    @url = new_session_url
    mail(to: user.email, subject: "Account requires activation")
  end
end

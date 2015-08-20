class UserMailer < ApplicationMailer
  default from: "rjdabbar@gmail.com"

  def welcome_email(user)
    @user = user
    @url = "http://localhost:3000/users/#{@user.id}/activate?activation_token=#{@user.activation_token}"
    mail(to: user.email, subject: "Account requires activation  ")
  end
end

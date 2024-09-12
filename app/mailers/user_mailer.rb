class UserMailer < ApplicationMailer
  default from: 'methalservices@gmail.com'

  def welcome_email
    @user = params[:user]
    puts 'user is'
    p params 
    p @user

    mail(to: @user.email, subject: 'Thank you for signing up')
  end

end

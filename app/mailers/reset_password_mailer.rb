class ResetPasswordMailer < ApplicationMailer
  default_url_options[:host] = "localhost:3000"
  default from: "no-reply.com"
  
  def password_reset(user)
    @user = user
    mail(to: @user.email,
         subject: 'Reset your Password')
  end
end

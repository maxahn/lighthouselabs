class UserMailer < ActionMailer::Base
  default from: "notifications@lighthouselabs.com"

  def account_deleted(user)
    @user = user
    mail(to: @user.email, subject: 'Your account has been deleted')
  end
end

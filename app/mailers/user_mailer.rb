class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
   mail(
     from: 'THP.niceteam@gmail.com',
     to: @user.email,
     delivery_method_options: { api_key: Rails.application.credentials.dig(:mailjet, :api_key_mailjet), secret_key: Rails.application.credentials.dig(:mailjet, :secret_key_mailjet) },
     subject: 'Well done'
   ) do |format|
      format.html
  end
 end


end

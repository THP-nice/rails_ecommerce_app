class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @item = Item.first
   mail(
     from: 'THP.niceteam@gmail.com',
     to: user.email,
     delivery_method_options: { api_key: Rails.application.credentials.dig(:mailjet, :api_key_mailjet), secret_key: Rails.application.credentials.dig(:mailjet, :secret_key_mailjet) },
     subject: "Well done #{user.name}, you've got a cat"
   ) do |format|
      format.html
  end
 end

end

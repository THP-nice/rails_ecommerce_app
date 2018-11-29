class AdminMailer < ApplicationMailer

def confirm_email
 mail(
   from: 'THP.niceteam@gmail.com',
   to: 'THP.niceteam@gmail.com',
   delivery_method_options: { api_key: Rails.application.credentials.dig(:mailjet, :api_key_mailjet), secret_key: Rails.application.credentials.dig(:mailjet, :secret_key_mailjet) },
   subject: "Someone buy a cat"
 ) do |format|
    format.html
end
end

end

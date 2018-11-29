class AdminMailer < ApplicationMailer

def confirm_email()
 mail(
   to: 'THP.niceteam@gmail.com',
   subject: "Someone buy a cat"
 )
end

end

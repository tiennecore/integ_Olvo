class CommandNotifierMailer < ApplicationMailer
  default :from => 'wvetienne@gmail.com'

  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_signup_email(user,command)
    @user = user
    @command= command
    subjectMail= 'Nouvelle commande de ' + @user.username
    mail( :to => @user.email,
    :subject => subjectMail )
  end
end

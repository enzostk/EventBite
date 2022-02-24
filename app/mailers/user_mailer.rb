class UserMailer < ApplicationMailer

  def welcome_email(user)
    @user = user
    @url = 'https://cometogether2.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Bienvenue sur ComeTogether')
  end

  def participation_email(attendance)
    @admin = User.find(attendance.event.admin_id)
    @event = Event.find(attendance.event.id)
    @participant = User.find(attendance.user.id)
    mail(to: @admin.email, subject: 'Nouveau participant')    
  end
end

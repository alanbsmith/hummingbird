class Invitation < ActionMailer::Base
  default from "friendlypostman@hummingbird.com"

  def invite(project,user,to,subject,body)
    @user = user
    @project = project
    mail(to: to, subject: subject)
  end
  
end
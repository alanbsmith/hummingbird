class InvitesController < ApplicationController
  def create
    @invite = Invite.new(safe_params)
    Invitation.invite(@invite.trip,
                      @invite.user = current_user,
                      @invite.to,
                      @invite.subject,
                      @invite.body
                      ).deliver
    
    redirect_to :back, notice: "Your email has been sent!"
  end

  private

  def safe_params
    new_params        = params.require(:invite).permit(:project, 
                                                       :user, 
                                                       :to, 
                                                       :from, 
                                                       :subject, 
                                                       :body)
    
    new_params[:project] = Project.find(params[:invite][:project])
    new_params
  end
end
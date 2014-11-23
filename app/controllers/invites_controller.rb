class InvitesController < ApplicationController
  def create
    @invite = Invite.new(safe_params)
    Invitation.invite(@invite.project, #invite may not have a project field
                      @invite.user = current_user,
                      @invite.to,
                      @invite.subject,
                      @invite.body
                      ).deliver
    
    redirect_to :back, notice: "Your email has been sent!"
  end

  private

  def safe_params
    params.require(:invite).permit(:project,
                                   :user, 
                                   :to, 
                                   :from, 
                                   :subject, 
                                   :body)
    
  end
end
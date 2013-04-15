class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_pledge(pledge)
    @pledge = pledge
    @backer = @pledge.user
    @project = @pledge.project
    @owner = @project.user

    mail(:to => @owner.email, :subject => "Your project received some backing on Crowdfunder.")

  end


end

class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def registerUser
    @greeting = "Hi"

    mail to: "to@example.org"
  end

  def resetPassword
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end

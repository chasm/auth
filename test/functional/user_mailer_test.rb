require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  test "registerUser" do
    mail = UserMailer.registerUser
    assert_equal "Registeruser", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "resetPassword" do
    mail = UserMailer.resetPassword
    assert_equal "Resetpassword", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end

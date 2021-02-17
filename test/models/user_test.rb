require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Example User", email: "user@example.com",
                     password: "foobar", password_confirmation: "foobar")
  end

  test "name should be present" do
    @user.name = "      "
    assert_not @user.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "Foo@BAR.CoM"
    @user.email = mixed_case_email
    @user.save
    assert_equal mixed_case_email.downcase, @user.reload.email
  end

  test "too short password will not be allowed" do
    @user.password = "foo"
    @user.password_confirmation = "foo"
    assert_not @user.valid?
  end
end

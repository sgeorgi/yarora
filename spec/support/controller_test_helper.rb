module ControllerTestHelper
  def login_user _user
    @request.env["devise.mapping"] = Devise.mappings[:user]
    _user.confirm!
    sign_in _user
  end
end
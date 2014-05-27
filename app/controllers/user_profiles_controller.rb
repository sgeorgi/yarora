#
# User Profile Controller
#

class UserProfilesController < ApplicationController

  # GET #show /user_profile
  #
  def show
    @user_profile = current_user.user_profile
  end
end
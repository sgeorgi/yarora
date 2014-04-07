#
# WelcomeController used as a landing for the Application
#
class WelcomeController < ApplicationController

  #
  # GET features/ (features_path)
  #
  def features
    redirect_to root_path, alert: 'Feature Disabled' if FeatureToggle.off?(:feature_page)
  end

  #
  # GET / (root_path)
  #
  def index
    puts flash[:warn]
  end
end
#
# WelcomeController used as a landing for the Application
#
class WelcomeController < ApplicationController

  # before_action :authenticate_user!, only: [:features]

  #
  # GET features/ (features_path)
  # @return the feature page
  #
  def features
    redirect_to root_path, alert: 'Feature Disabled' if FeatureToggle.off?(:feature_page)
  end

  #
  # GET / (root_path)
  # @return the index page
  #
  def index
  end
end
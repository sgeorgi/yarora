class WelcomeController < ApplicationController

  def features
    redirect_to root_path, alert: 'Feature Disabled' if FeatureToggle.off?(:feature_page)
  end

  def index
    puts flash[:warn]
  end
end
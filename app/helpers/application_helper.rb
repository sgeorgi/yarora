# Some useful basic helper methods
module ApplicationHelper

  #
  # Checks if given Feature is active
  # @params [Symbol] feature to check
  # @return [Boolean] feature toggle's state
  #
  def feature_on?(_feature)
    FeatureToggle.on?(_feature)
  end

  #
  # Checks if given Feature is inactive
  # @params [Symbol] feature to check
  # @return [Boolean] feature toggle's state
  #
  def feature_off?(_feature)
    FeatureToggle.off?(_feature)
  end
end

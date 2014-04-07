# Some useful basic helper methods
module ApplicationHelper

  #
  # Displays the alternate locale icon of the already enabled locale
  #
  def locale_switch
    _locale = I18n.locale
    _new_locale = case _locale
                    when :en
                      'de'
                    when :de
                      'en'
                  end

    link_to image_tag("#{_new_locale}.png"), url_for(locale: _new_locale)
  end

  #
  # Checks if given Feature is active by consulting the FeatureToggle module.
  #
  # @example
  #   feature_on?(:super_feature) # => true
  #
  # @params _feature [Symbol] feature to check
  # @return [Boolean] feature toggle's state
  #
  def feature_on?(_feature)
    FeatureToggle.on?(_feature)
  end

  #
  # Checks if given Feature is inactive by consulting the FeatureToggle module.
  #
  # @example
  #   feature_off?(:super_feature) # => false
  #
  # @params _feature [Symbol] feature to check
  # @return [Boolean] feature toggle's state
  #
  def feature_off?(_feature)
    FeatureToggle.off?(_feature)
  end
end

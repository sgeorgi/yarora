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

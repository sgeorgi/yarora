#
# Simple Module that serves as a Feature Toggle. Features are declared in config/features.yml
# and can be checked against e.g. FeatureToggle.on?(:super_service) 
#
module FeatureToggle
  #
  # Returns wheter a specified feature is toggled
  # 
  # @example
  #  FeatureToggle.on?(:super_feature) => false
  # 
  # @param _feat [String or Symbol] feature identifier
  # @return [Boolean] toggle state
  #
  def self.on?(_feat)
    load_from_yaml
    @features[_feat.to_s] || false
  end

  #
  # Returns wheter a specified feature is NOT toggled
  #
  # @example
  #  FeatureToggle.on?(:super_feature) => true
  # 
  # @param _feat [String or Symbol] feature identifier
  # @return [Boolean] toggle state
  #
  def self.off?(_feat)
    load_from_yaml
    ! on?(_feat)
  end

  private

  def self.load_from_yaml
    _file = File.join(Rails.root, 'config/features.yml')
    raise 'Feature File not found (config/features.yml)' unless File.exists?(_file)
    @features = YAML.load_file(_file)
  end
end

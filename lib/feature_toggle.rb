module FeatureToggle

  def self.on?(_feat)
    load_from_yaml
    @features[_feat.to_s] || false
  end

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
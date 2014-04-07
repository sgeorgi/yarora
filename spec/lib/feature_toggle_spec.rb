require 'spec_helper'

describe FeatureToggle do
  describe '#on?' do
    it 'returns true for :test_feature' do
      expect(FeatureToggle.on?(:test_feature)).to be(true)
    end

    it 'returns false for undefined feature' do
      expect(FeatureToggle.on?(:undefined)).to be(false)
    end
  end

  describe '#off?' do
    it 'returns false for activated :test_feature' do
      expect(FeatureToggle.off?(:test_feature)).to be(false)
    end

    it 'returns true for undefined feature' do
      expect(FeatureToggle.off?(:undefined)).to be(true)
    end
  end
end
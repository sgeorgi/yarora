require 'spec_helper'

describe ApplicationHelper do
  describe '#feature_on?' do
    it 'returns true for :test_feature' do
      expect(feature_on?(:test_feature)).to be(true)
    end

    it 'returns false for :undefined' do
      expect(feature_on?(:undefined)).to be(false)
    end
  end

  describe '#feature_off?' do
    it 'returns false for :test_feature' do
      expect(feature_off?(:test_feature)).to be(false)
    end

    it 'returns true for :undefined' do
      expect(feature_off?(:undefined)).to be(true)
    end
  end
end
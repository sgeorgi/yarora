require 'spec_helper'

describe ApplicationHelper do
  describe '#feature_on?' do
    it 'returns true for :test_feature' do
      allow(YAML).to receive(:load_file).and_return({ 'test_feature' => true })
      expect(feature_on?(:test_feature)).to be_true
    end

    it 'returns false for :undefined' do
      expect(feature_on?(:undefined)).to be_false
    end
  end

  describe '#feature_off?' do
    it 'returns false for :test_feature' do
      allow(YAML).to receive(:load_file).and_return({ 'test_feature' => true })
      expect(feature_off?(:test_feature)).to be_false
    end

    it 'returns true for :undefined' do
      expect(feature_off?(:undefined)).to be_true
    end
  end

  describe '#locale_switch' do
    # it 'returns a link to switch locales' do
    #   expect(helper.locale_switch).to eq("")
    # end
    pending 'ActionController::UrlGenerationError: No route matches {:locale=>"en"}'
  end
end
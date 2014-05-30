require 'spec_helper'

describe Profile::Address do
  it 'creates from a Factory' do
    expect { create :profile_address }.not_to raise_error
  end

  describe 'ASSOCIATIONS' do
    let(:profile_address) { Profile::Address.new }

    it 'belongs_to #user_profile' do
      expect(profile_address).to belong_to(:user_profile)
    end
  end

  describe 'VALIDATIONS' do
    let(:profile_address) { Profile::Address.new }

    describe '#street_1' do
      it 'fails validation unless present' do
        expect(profile_address).to validate_presence_of(:street_1).on(:update)
      end
    end

    describe '#city' do
      it 'fails validation unless present' do
        expect(profile_address).to validate_presence_of(:city).on(:update)
      end
    end

    describe '#postal_code' do
      it 'fails validation unless present' do
        expect(profile_address).to validate_presence_of(:postal_code).on(:update)
      end

      it 'fails validation for wrong format' do
        expect(profile_address).not_to allow_value(1234, 123456).for(:postal_code).on(:update)
      end
    end
  end
end

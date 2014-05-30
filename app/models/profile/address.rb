class Profile::Address < ActiveRecord::Base
  belongs_to :user_profile

  validates :street_1, presence: true, on: :update
  validates :city, presence: true, on: :update
  validates :postal_code, presence: true,
            format: { with: /\d/ },
            length: { is: 5 },
            on: :update
end

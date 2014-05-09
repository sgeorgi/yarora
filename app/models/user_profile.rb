#
# The User Profile
#
class UserProfile < ActiveRecord::Base
  belongs_to :user
  validates :name, presence: true
end
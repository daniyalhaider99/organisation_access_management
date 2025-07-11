# app/models/organization.rb
class Organization < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships
  has_many :proposals

  validates :minimum_age, numericality: { greater_than_or_equal_to: 0 }

  def allows_participation?(user)
    return true if user.admin? # Admins can always join
    return false if minimum_age && user.age && user.age < minimum_age
    # Add more rules as needed, e.g., check participation_rules JSON
    true
  end
end

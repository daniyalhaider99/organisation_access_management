class Ability < ApplicationRecord
  validates :resource_type, :action, presence: true
  validates :allowed, inclusion: { in: [true, false] }

  def self.resources
    %w[Proposal Organization Membership User]
  end

  def self.actions
    %w[index show create update destroy]
  end
end

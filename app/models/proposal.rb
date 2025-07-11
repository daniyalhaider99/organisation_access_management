# app/models/proposal.rb

class Proposal < ApplicationRecord
  belongs_to :organization

  scope :for_age_group, ->(group) { where(age_group: group) }
end

module AgeGroupAccessPolicy
  extend ActiveSupport::Concern

  def correct_age_group?
    record.respond_to?(:age_group) ? record.age_group == user.age_group : true
  end
end
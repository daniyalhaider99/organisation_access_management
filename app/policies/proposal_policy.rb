# app/policies/proposal_policy.rb
class ProposalPolicy < ApplicationPolicy
  include OrganizationMembershipPolicy
  include AgeGroupAccessPolicy

  def index?
    allowed_by_ability?(:index) || organization_member?
  end

  def show?
    (allowed_by_ability?(:show) || organization_member?) && correct_age_group?
  end

  def create?
    allowed_by_ability?(:create) & organization_admin?
  end

  def update?
    allowed_by_ability?(:update) & organization_admin?
  end

  def destroy?
    allowed_by_ability?(:destroy) & organization_admin?
  end

  class Scope < Scope
    def resolve
      scope.where(organization: user.organizations, age_group: user.age_group)
    end
  end
end

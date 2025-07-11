class OrganizationPolicy < ApplicationPolicy
  include OrganizationMembershipPolicy

  def index?
    allowed_by_ability?(:index)
  end

  def show?
    allowed_by_ability?(:show) && organization_member? && record.allows_participation?(user)
  end

  def create?
    allowed_by_ability?(:create)
  end

  def update?
    allowed_by_ability?(:update) || organization_admin?
  end

  def destroy?
    allowed_by_ability?(:destroy) || organization_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
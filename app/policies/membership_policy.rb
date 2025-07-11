class MembershipPolicy < ApplicationPolicy
  include OrganizationMembershipPolicy

  def index?
    allowed_by_ability?(:index) || organization_admin?
  end

  def show?
    allowed_by_ability?(:show) || organization_admin?
  end

  def create?
    allowed_by_ability?(:create) && organization_admin?
  end

  def update?
    allowed_by_ability?(:update) && organization_admin?
  end

  def destroy?
    allowed_by_ability?(:destroy) && organization_admin?
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
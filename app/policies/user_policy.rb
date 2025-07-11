class UserPolicy < ApplicationPolicy
  def index?
    allowed_by_ability?(:index)
  end

  def show?
    allowed_by_ability?(:show)
  end

  def create?
    allowed_by_ability?(:create)
  end

  def update?
    allowed_by_ability?(:update)
  end

  def destroy?
    allowed_by_ability?(:destroy)
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
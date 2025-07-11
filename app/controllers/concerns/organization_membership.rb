module OrganizationMembership
  extend ActiveSupport::Concern

  included do
    private

    def require_organization_admin!(organization)
      membership = current_user.memberships.find_by(organization: organization)
      head :forbidden unless membership&.admin?
    end

    def require_organization_member!(organization)
      membership = current_user.memberships.find_by(organization: organization)
      head :forbidden unless membership
    end
  end
end
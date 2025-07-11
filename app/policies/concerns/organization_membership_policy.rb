module OrganizationMembershipPolicy
  extend ActiveSupport::Concern

  def organization_admin?
    user.admin? || Membership.find_by(user: user, organization: extract_organization(record))&.admin?
  end

  def organization_member?
    user.admin? || Membership.exists?(user: user, organization: extract_organization(record))
  end

  private

  def extract_organization(record)
    if record.respond_to?(:organization)
      record.organization
    elsif record.respond_to?(:organization_id)
      Organization.find_by(id: record.organization_id)
    elsif record.is_a?(Organization)
      record
    else
      nil
    end
  end
end
class OrganizationAnalyticsService
  def initialize(organization)
    @organization = organization
  end

  def stats
    {
      member_count: @organization.users.count,
      proposal_count: @organization.proposals.count,
      proposals_by_age_group: @organization.proposals.group(:age_group).count,
      members_by_role: @organization.memberships.group(:role).count
    }
  end
end
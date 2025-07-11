puts "Creating users..."

# Admin users
admin = User.create!(
  email: "admin@example.com",
  password: "password123",
  name: "System Administrator",
  birthdate: 25.years.ago.to_date,
  admin: true
)

# Adult users (18+)
adult1 = User.create!(
  email: "john.doe@example.com",
  password: "password123",
  name: "John Doe",
  birthdate: 19.years.ago.to_date
)

adult2 = User.create!(
  email: "jane.smith@example.com",
  password: "password123",
  name: "Jane Smith",
  birthdate: 20.years.ago.to_date
)

adult3 = User.create!(
  email: "mike.wilson@example.com",
  password: "password123",
  name: "Mike Wilson",
  birthdate: 21.years.ago.to_date
)

# Teen users (13-17)
teen1 = User.create!(
  email: "sarah.jones@example.com",
  password: "password123",
  name: "Sarah Jones",
  birthdate: 13.years.ago.to_date,
  parental_consent: true
)

teen2 = User.create!(
  email: "alex.chen@example.com",
  password: "password123",
  name: "Alex Chen",
  birthdate: 15.years.ago.to_date,
  parental_consent: true
)

teen3 = User.create!(
  email: "emma.davis@example.com",
  password: "password123",
  name: "Emma Davis",
  birthdate: 17.years.ago.to_date,
  parental_consent: false  # Pending parental consent
)

# Child users (under 13)
child1 = User.create!(
  email: "tommy.brown@example.com",
  password: "password123",
  name: "Tommy Brown",
  birthdate: 11.years.ago.to_date,
  parental_consent: true
)

child2 = User.create!(
  email: "lily.garcia@example.com",
  password: "password123",
  name: "Lily Garcia",
  birthdate: 12.years.ago.to_date,
  parental_consent: false  # Pending parental consent
)

puts "Creating organizations..."

# Youth-focused organization (all ages welcome)
youth_council = Organization.create!(
  name: "Youth Leadership Council",
  minimum_age: 0,  # No minimum age
  participation_rules: {
    "description" => "Inclusive youth organization for all ages",
    "allowed_roles" => ["member", "admin"],
    "parental_consent_required" => true
  }
)

# Teen-focused organization (13+ only)
teen_tech_club = Organization.create!(
  name: "Teen Tech Innovators",
  minimum_age: 13,
  participation_rules: {
    "description" => "Technology and innovation club for teens",
    "allowed_roles" => ["member", "admin"],
    "parental_consent_required" => true,
    "focus_areas" => ["coding", "robotics", "digital_art"]
  }
)

# Adult professional organization (18+ only)
professional_network = Organization.create!(
  name: "Professional Development Network",
  minimum_age: 18,
  participation_rules: {
    "description" => "Professional networking and career development",
    "allowed_roles" => ["member", "admin"],
    "parental_consent_required" => false,
    "focus_areas" => ["career_advancement", "mentoring", "industry_events"]
  }
)

# Community service organization (16+)
community_service = Organization.create!(
  name: "Community Service Alliance",
  minimum_age: 16,
  participation_rules: {
    "description" => "Community service and volunteer opportunities",
    "allowed_roles" => ["member", "admin"],
    "parental_consent_required" => true,
    "focus_areas" => ["volunteering", "community_outreach", "social_impact"]
  }
)

puts "Creating memberships..."

# Youth Council memberships (all ages)
Membership.create!(user: admin, organization: youth_council, role: "admin")
Membership.create!(user: adult1, organization: youth_council, role: "admin")
Membership.create!(user: teen1, organization: youth_council, role: "member")
Membership.create!(user: teen2, organization: youth_council, role: "member")
Membership.create!(user: child1, organization: youth_council, role: "member")

# Teen Tech Club memberships (13+ only)
Membership.create!(user: admin, organization: teen_tech_club, role: "admin")
Membership.create!(user: teen1, organization: teen_tech_club, role: "admin")
Membership.create!(user: teen2, organization: teen_tech_club, role: "member")

# Professional Network memberships (18+ only)
Membership.create!(user: admin, organization: professional_network, role: "admin")
Membership.create!(user: adult1, organization: professional_network, role: "admin")
Membership.create!(user: adult2, organization: professional_network, role: "member")
Membership.create!(user: adult3, organization: professional_network, role: "member")

# Community Service memberships (16+)
Membership.create!(user: admin, organization: community_service, role: "admin")
Membership.create!(user: adult1, organization: community_service, role: "admin")
Membership.create!(user: teen1, organization: community_service, role: "member")
Membership.create!(user: teen2, organization: community_service, role: "member")

puts "Creating proposals..."

# Youth Council proposals (age-appropriate content)
Proposal.create!(
  title: "Youth Art Festival",
  description: "Annual art showcase for young artists of all ages",
  organization: youth_council,
  age_group: "child"
)

Proposal.create!(
  title: "Teen Leadership Workshop",
  description: "Leadership skills development for teenagers",
  organization: youth_council,
  age_group: "teen"
)

Proposal.create!(
  title: "Intergenerational Mentoring Program",
  description: "Connect youth with adult mentors",
  organization: youth_council,
  age_group: "adult"
)

# Teen Tech Club proposals
Proposal.create!(
  title: "Coding Bootcamp for Teens",
  description: "Learn Python, JavaScript, and web development",
  organization: teen_tech_club,
  age_group: "teen"
)

Proposal.create!(
  title: "Robotics Competition",
  description: "Build and program robots for friendly competition",
  organization: teen_tech_club,
  age_group: "teen"
)

Proposal.create!(
  title: "Digital Art Workshop",
  description: "Create digital art using modern tools and techniques",
  organization: teen_tech_club,
  age_group: "teen"
)

# Professional Network proposals
Proposal.create!(
  title: "Career Networking Event",
  description: "Connect with industry professionals and potential employers",
  organization: professional_network,
  age_group: "adult"
)

Proposal.create!(
  title: "Professional Skills Workshop",
  description: "Develop communication, leadership, and technical skills",
  organization: professional_network,
  age_group: "adult"
)

Proposal.create!(
  title: "Industry Panel Discussion",
  description: "Learn from successful professionals in various fields",
  organization: professional_network,
  age_group: "adult"
)

# Community Service proposals
Proposal.create!(
  title: "Local Park Cleanup",
  description: "Volunteer to clean and maintain local parks",
  organization: community_service,
  age_group: "adult"
)

Proposal.create!(
  title: "Food Bank Volunteering",
  description: "Help sort and distribute food to those in need",
  organization: community_service,
  age_group: "adult"
)

Proposal.create!(
  title: "Youth Mentoring Program",
  description: "Mentor younger students in academic and life skills",
  organization: community_service,
  age_group: "teen"
)

puts "Creating abilities (permissions)..."

# Define abilities for different age groups and resources
resources = ['Proposal', 'Organization', 'Membership', 'User']
actions = ['index', 'show', 'create', 'update', 'destroy']
age_groups = ['child', 'teen', 'adult']

# Children: Limited permissions
age_groups.each do |age_group|
  resources.each do |resource|
    actions.each do |action|
      allowed = case age_group
                when 'child'
                  # Children can only view proposals and organizations they're members of
                  (resource == 'Proposal' && action.in?(%w[show index])) ||
                  (resource == 'Organization' && action.in?(%w[show index]))
                when 'teen'
                  # Teens have more permissions but still limited
                  (resource == 'Proposal' && ['index', 'show'].include?(action)) ||
                  (resource == 'Organization' && ['index', 'show'].include?(action)) ||
                  (resource == 'Membership' && action.in?(%w[show index]))
                when 'adult'
                  # Adults have full permissions
                  true
                end

      Ability.create!(
        resource_type: resource,
        action: action,
        age_group: age_group,
        allowed: allowed
      )
    end
  end
end

puts "Seed data created successfully!"
puts ""
puts "Test Accounts:"
puts "Admin: admin@example.com / password123"
puts "Adult: john.doe@example.com / password123"
puts "Teen (with consent): sarah.jones@example.com / password123"
puts "Teen (pending consent): emma.davis@example.com / password123"
puts "Child (with consent): tommy.brown@example.com / password123"
puts "Child (pending consent): lily.garcia@example.com / password123"
puts ""
puts "Organizations created:"
puts "- Youth Leadership Council (all ages, 0+ minimum age)"
puts "- Teen Tech Innovators (teens only, 13+ minimum age)"
puts "- Professional Development Network (adults only, 18+ minimum age)"
puts "- Community Service Alliance (16+ minimum age)"

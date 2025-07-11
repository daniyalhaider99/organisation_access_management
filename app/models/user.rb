# app/models/user.rb

class User < ApplicationRecord
  include Pundit::Authorization
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable, :registerable,
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable
  has_many :memberships
  has_many :organizations, through: :memberships

  enum age_group: { child: "child", teen: "teen", adult: "adult" }

  before_create :set_age_group

  def age
    return unless birthdate
    now = Time.zone.now
    now.year - birthdate.year - ((now.month > birthdate.month || (now.month == birthdate.month && now.day >= birthdate.day)) ? 0 : 1)
  end

  def determine_age_group
    return 'child' if age < 13
    return 'teen' if age < 18
    'adult'
  end

  # Add admin? method for role-based access
  def admin?
    self[:admin]
  end

  def needs_parental_consent?
    age.present? && age < 13
  end

  def can_participate?
    !needs_parental_consent? || parental_consent?
  end

  def parental_consent?
    parental_consent
  end

  private

  def set_age_group
    self.age_group = determine_age_group
  end
end


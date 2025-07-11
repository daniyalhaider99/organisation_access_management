# app/controllers/organizations_controller.rb

class OrganizationsController < ApplicationController
  include OrganizationMembership
  before_action :authenticate_user!
  before_action :set_organization, only: %i[show edit update destroy analytics]
  before_action only: %i[edit update destroy analytics] do
    require_organization_admin!(@organization)
  end
  before_action only: %i[show] do
    require_organization_member!(@organization)
  end

  def index
    if current_user.admin? || current_user.adult?
      @organizations = Organization.includes(:users)
    else
      @organizations = current_user.organizations
    end
  end

  def show; end

  def new
    @organization = Organization.new
  end
  def create; end
  def edit; end
  def update; end
  def destroy; end

  def analytics
    @stats = OrganizationAnalyticsService.new(@organization).stats
  end

  private

  def set_organization
    @organization = Organization.find(params[:id])
  end
end

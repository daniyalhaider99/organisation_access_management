# app/controllers/memberships_controller.rb
class MembershipsController < ApplicationController
  before_action :authenticate_user!

  def create
    org = Organization.find(params[:organization_id])
    if org.allows_participation?(current_user) && current_user.can_participate?
      Membership.create(user: current_user, organization: org, role: 'member')
      redirect_to org, notice: 'You joined the organization.'
    else
      redirect_to organizations_path, alert: 'You do not meet the participation requirements for this organization.'
    end
  end

  def destroy
    membership = Membership.find_by(id: params[:id])
    if membership.destroy
      flash[:notice] = 'Left organization.'
      redirect_to organizations_path
    end
  end

  def index
    id = params[:user_id] || current_user.id
    @memberships = current_user.memberships.includes(:organization).where(user_id: id)
  end
end

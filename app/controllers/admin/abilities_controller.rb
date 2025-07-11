class Admin::AbilitiesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_admin

  def index
    @age_groups = User.age_groups.keys
    @selected_age_group = params[:age_group] || @age_groups.first
    @resources = Ability.resources
    @actions = Ability.actions
    @abilities = Ability.where(age_group: @selected_age_group).pluck(:resource_type, :action, :allowed, :id).each_with_object({}) do |(resource, action, allowed, id), hash|
      hash[[resource, action]] = { allowed: allowed, id: id }
    end
  end

  def update
    if params[:id].present?
      ability = Ability.find(params[:id])
    else
      ability = Ability.find_or_initialize_by(
        resource_type: params[:resource_type],
        action: params[:action],
        age_group: params[:age_group]
      )
    end
    ability.allowed = ActiveModel::Type::Boolean.new.cast(params[:allowed])
    ability.save!
    head :ok
  end

  private

  def require_admin
    head :forbidden unless current_user&.admin?
  end
end

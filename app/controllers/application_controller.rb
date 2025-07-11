class ApplicationController < ActionController::Base
  include Pundit

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :check_ability

  private

  def user_not_authorized
    flash[:alert] = "You are not authorized to perform this action."
    redirect_to(root_path)
  end

  def check_ability
    # Skip for admin controllers and Devise controllers
    return if self.class.name.start_with?("Admin::")
    return if self.class.name.start_with?("Dashboard")
    return if devise_controller?
    return unless user_signed_in?

    resource_name = controller_name.classify
    action = action_name.to_sym
    # Try to get the record for policy (e.g., @user, @organization, etc.)
    record = instance_variable_get("@#{controller_name.singularize}")
    policy = policy(record || resource_name.constantize.new)
    unless policy.allowed_by_ability?(action)
      raise Pundit::NotAuthorizedError
    end
  end
end

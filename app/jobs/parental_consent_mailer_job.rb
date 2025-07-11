class ParentalConsentMailerJob < ApplicationJob
  queue_as :default

  def perform(user_id)
    user = User.find(user_id)
    ParentalConsentMailer.consent_request(user).deliver_later
  end
end
class ParentalConsentMailer < ApplicationMailer
  def consent_request(user)
    @user = user
    mail(to: @user.parent_email, subject: 'Parental Consent Required')
  end
end
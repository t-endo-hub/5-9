
class Users::RegistrationsController < Devise::RegistrationsController
  def create
    super
    ThanksMailer.registration_confirmation(resource).deliver
end

end

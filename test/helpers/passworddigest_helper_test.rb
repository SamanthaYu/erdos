=begin require "bcrypt"

module PasswordDigestHelper

  include BCrypt
  def create_password_digest(thepassword)
    cost= ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : Bcrypt::Engine.cost
    Bcrypt::Password.create(thepassword,cost: cost)
  end

end

=end

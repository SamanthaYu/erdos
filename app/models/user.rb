class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages


  validates :username, presence: true, length: {maximum: 50}

  def User.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : Bcrypt::Engine.cost
    Bcrypt::Password.create(string,cost:cost)
  end

  has_secure_password

end

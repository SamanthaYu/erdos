class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :friendships
  has_many :friends, :through => :friendships

  before_save {username.downcase!}

  validates :username, presence: true, length: {minimum: 3, maximum: 50}, uniqueness: {case_sensitive: false}

  def User.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : Bcrypt::Engine.cost
    Bcrypt::Password.create(string,cost:cost)
  end

  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 30}

end

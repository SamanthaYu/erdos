class User < ApplicationRecord
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  before_save {username.downcase!}
  before_destroy :delete_friendships

  validates :username, presence: true, length: {minimum: 3, maximum: 50}, uniqueness: {case_sensitive: false}

  def User.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : Bcrypt::Engine.cost
    Bcrypt::Password.create(string,cost:cost)
  end

  def delete_friendships
    self.friendships.delete_all
    self.inverse_friendships.delete_all
  end

  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 30}

end

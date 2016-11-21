class User < ApplicationRecord
  mount_uploader :avatar, AvatarUploader
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :private_chats
  has_many :private_chatrooms, :through => :private_chats, :source => :chatroom
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  validates_processing_of :avatar
  validate :avatar_size_validation

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

  def avatar_size_validation
    errors[:avatar] << "too big - avatar should be less than 500KB" if avatar.size > 0.5.megabytes
  end

  def allChatrooms
      self.chatrooms |= self.private_chatrooms
      self.chatrooms.sort_by(&:created_at)
  end

  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 30}

end

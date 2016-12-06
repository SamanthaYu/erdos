class User < ApplicationRecord
  acts_as_reader
  mount_uploader :avatar, AvatarUploader
  has_many :messages
  has_many :chatrooms, through: :messages
  has_many :private_chats
  has_many :private_chatrooms, :through => :private_chats, :source => :chatroom
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user
  has_many :notifications, dependent: :destroy
  has_many :owned_chatrooms, :class_name => "Chatroom", :foreign_key => "user_id"
  validates_processing_of :avatar
  validate :avatar_size_validation
  attr_accessor :skip_password_validation

  before_destroy :delete_friendships
  validates :username, presence: true, length: {minimum: 3, maximum: 12}, uniqueness: {case_sensitive: true}

  def User.digest(string)
    cost= ActiveModel::SecurePassword.min_cost ? Bcrypt::Engine::MIN_COST : Bcrypt::Engine.cost
    Bcrypt::Password.create(string,cost:cost)
  end

  def delete_friendships
    self.friendships.delete_all
    self.inverse_friendships.delete_all
  end

  def avatar_size_validation
    errors[:avatar] << "too big - avatar should be less than 1MB" if avatar.size > 1.0.megabytes
  end

  has_secure_password
  validates :password, presence: true, length: {minimum: 6, maximum: 30}, unless: :skip_password_validation

end

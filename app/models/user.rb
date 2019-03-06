class User < ApplicationRecord
  belongs_to :user_role
  has_many :movies
  has_many :comments

  attr_reader :remember_token
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :last_name, presence: true, length: {maximum: Settings.user.max_last_name}
  validates :first_name, presence: true, length: {maximum: Settings.user.max_first_name}
  validates :email, presence: true, length: {maximum: Settings.user.max_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  validates :password, presence: true, length: {minimum: Settings.user.min_password}, allow_nil: true

  has_secure_password

  class << self
    def digest string
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                    BCrypt::Engine.cost
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    @remember_token = User.new_token
    update remember_digest: User.digest(@remember_token)
  end

  def authenticated? remember_token
    return false unless remember_digest.present?
    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update remember_digest: nil
  end
end

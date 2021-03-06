class User < ApplicationRecord
  has_many :belongings
  has_many :groups, through: :belongings
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 }, 
		format: { with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
	has_secure_password

	def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def authenticated?(token)
    digest = password_digest
  	return false if digest.nil?
  	BCrypt::Password.new(digest).is_password?(token)
  end

end

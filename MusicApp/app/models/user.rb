class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :session_token, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  after_initialize :ensure_session_token, :set_new_users_to_inactive,
                  :ensure_activation_token, :set_new_users_to_non_admins

  has_many :notes

  def self.generate_secure_token
    SecureRandom::urlsafe_base64(16)
  end

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end

  def reset_session_token!
    self.session_token = User.generate_secure_token
    self.save!
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def password_digest
    BCrypt::Password.new(super)
  end

  def is_password?(password)
    self.password_digest.is_password?(password)
  end

  def activate!
    self.update!(active: true) if !activated?
  end

  def activated?
    self.active
  end

  def admin?
    self.admin
  end
  private

  def ensure_session_token
    self.session_token ||= User.generate_secure_token
  end

  def ensure_activation_token
    self.activation_token ||= User.generate_secure_token
  end

  def set_new_users_to_inactive
    self.active ||= false
  end

  def set_new_users_to_non_admins
    self.admin ||= false
  end

end

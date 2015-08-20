class User < ActiveRecord::Base
  attr_reader :password

  validates :email, :password, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true}

  def self.generate_session_token
    SecureRandom::urlsafe_base64(16)
  end

end

class User < ActiveRecord::Base
  attr_reader :password
  before_validation :generate_session_token
  attr_accessible :session_token, :username, :password
  validates :username, :password_digest, :session_token,
    :presence => true
  validates :password, :length => { :minimum => 6 }, :on => :create
  validates :username, :uniqueness => true

  has_many(:subs,
           :foreign_key => :mod_id)
  has_many(:links)

  def password=(secret)
    @password = secret
    self.password_digest = BCrypt::Password.create(secret)
  end

  def generate_session_token
    self.session_token = SecureRandom.urlsafe_base64
  end

  def reset_session_token!
    generate_session_token
    self.save!
  end

  def self.find_by_credentials(username, password)
    user = User.find_by_username(username)
    return user if user && user.is_password?(password)
    nil
  end

  def is_password?(password)
    BCrypt::Password.new(password_digest).is_password?(password)
  end

end

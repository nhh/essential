class User < ApplicationRecord

  validates :username, presence: true
  validates :crypted_password, presence: true
  validates :email, presence: true

  acts_as_authentic do |c|
    c.login_field = :email
    c.crypto_provider = Authlogic::CryptoProviders::BCrypt
    c.validate_email_field=true
    c.validates_format_of_email_field_options = {:with => Authlogic::Regex.email_nonascii}
  end # the configuration block is optional

  before_create :lowercase_username
  before_create :lowercase_email

  def lowercase_username
    self.username.downcase!
  end

  def lowercase_email
    self.username.downcase!
  end

end
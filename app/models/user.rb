class User < ApplicationRecord
  devise :two_factor_authenticatable, :two_factor_backupable,
         :otp_secret_encryption_key => Rails.application.credentials.OTP_KEY

  devise :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  extend FriendlyId
  friendly_id :username, use: :slugged
  mount_uploader :avatar, AvatarUploader

  validates_uniqueness_of :username
  validates_presence_of :username
  validates :username, length: { in: 4..20 }
  attr_accessor :login
  validate :validate_username

  def validate_username
    if User.where(email: username).exists?
      errors.add(:username, :invalid)
    end
  end

  def gravatar_id
  	Digest::MD5::hexdigest(email.downcase)
  end

  def otp_qr_code
    issuer = 'starter'
    label = "#{issuer}:#{email}"
    qrcode = RQRCode::QRCode.new(otp_provisioning_uri(label, issuer: issuer))
    qrcode.as_svg(module_size: 4)
  end

  def self.find_first_by_auth_conditions(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    else
      if conditions[:email].nil?
        where(conditions).first
      else
        where(email: conditions[:email]).first
      end
    end
  end

end

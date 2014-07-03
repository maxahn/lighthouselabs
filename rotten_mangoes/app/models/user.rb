class User < ActiveRecord::Base

  has_many :reviews

  after_destroy :send_account_deleted_mail

  has_secure_password

  validates :email,
    presence: true

  validates :firstname,
    presence: true

  validates :lastname,
    presence: true

  validates :password,
    length: { in: 6..20 }, on: :create

  def full_name
    "#{firstname} #{lastname}"
  end

  def send_account_deleted_mail
    UserMailer.account_deleted(self).deliver
  end

end

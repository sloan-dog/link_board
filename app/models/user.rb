 class User < ActiveRecord::Base

  has_secure_password

  validates :email,
  presence: true,
  uniqueness: { case_sensitive: false },
  email_format: { message: "doesn't look like an email address" },
  on: :create

  validates :name,
  presence: true,
  length: { maximum: 20 },
  on: :create

  has_many :posts

  def self.authenticate email,password
    User.find_by_email(email).try(:authenticate, password)
  end

end

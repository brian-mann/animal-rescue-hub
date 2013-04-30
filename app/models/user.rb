class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password_digest

  before_save { |user| user.email = email.downcase }

  validates :email, :first_name, :last_name, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }

end

# == Schema Information
#
# Table name: users
#
#  id         :integer(4)      not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  email      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#
class User < ActiveRecord::Base
  attr_accessible :email, :first_name, :last_name, :password, :password_confirmation, :accept_terms
  has_secure_password

  has_many  :animals

  before_save { |user| user.email = email.downcase }
  before_save :create_remember_token

  validates :email, :first_name, :last_name, :password, :password_confirmation, presence: true
  validates :first_name, :last_name, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
	validates_acceptance_of :accept_terms, :accept => true, :message => "You must accept the Terms of Serveice & Privacy Policy to continue."

	def full_name
		self.first_name.titleize + " " + self.last_name.titleize
	end

  private

    def create_remember_token
      self.remember_token = SecureRandom.urlsafe_base64
    end
end




# == Schema Information
#
# Table name: users
#
#  id              :integer(4)      not null, primary key
#  first_name      :string(255)
#  last_name       :string(255)
#  email           :string(255)
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  password_digest :string(255)
#  accept_terms    :boolean(1)
#  remember_token  :string(255)
#  admin           :boolean(1)      default(FALSE)
#


class User < ApplicationRecord
	#before_create :generate_auth_token
has_secure_password
has_secure_token :auth_token

validates :password, presence: true,length:{minimum: 6}
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

has_secure_password

#def generate_auth_token
#	token=SecureRandom.urlsafe_base64
#	self.update_columns(auth_token: token)
#end
def self.valid_login?(email, password)
    user = find_by(email: email)
    if user && user.authenticate(password)
      user
    end
  end



end

class ApplicationController < ActionController::API
include ActionController::HttpAuthentication::Token::ControllerMethods


def require_login
	authenticate_token || render_unauthorized("Access Denied")
end

def current_user
	@current_user||=authenticate_token
end

def valid_login?(email,password)
	user=User.find_by(email: email)
	if user && user.authenticate(password)
		user
	end

end

def invalidate_auth_token
	self.update_columns(auth_token: nil)
end
protected
def render_unauthorized(message)
	errors={errors:[{detail:message}]}
	render json:errors,status: :unauthorized
	end
private

	def authenticate_token
		authenticate_with_http_token do |token,options|
			User.find_by(auth_token: token)
		end
	end


end

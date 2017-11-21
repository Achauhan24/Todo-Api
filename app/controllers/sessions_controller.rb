class SessionsController < ApplicationController
#before_action :require_login
skip_before_action :require_login, only: [:create], raise: false

def create
	if user = User.valid_login?(params[:email], params[:password])
		allow_token_to_be_used_once(user)
		send_auth_token_for_valid_login_of(user)
				
	else
		render_unauthorized("error with your login or password")
	end
end

def destroy
	current_user.invalidate_auth_token
	head :ok

end

private


def allow_token_to_be_used_once(user)
	SecureRandom.urlsafe_base64
end
def send_auth_token_for_valid_login_of(user)
	render json:{auth_token: user.auth_token}
end 


end

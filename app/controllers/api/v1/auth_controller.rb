class Api::V1::AuthController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def create # POST /api/v1/login
      @username = Username.find_by(name: username_login_params[:name])
      # @user.authenticate('password')
      if @username && @username.authenticate(username_login_params[:password_digest])
        @token = encode_token({ username_id: @username.id })
        render json: { username: UsernameSerializer.new(@username), jwt: @token }, status: :accepted
      else
        render json: { message: 'Invalid username or password' }, status: :unauthorized
      end
    end
  
    private
  
    def user_login_params
      # { user: { username: 'Chandler Bing', password: 'hi' } }
      params.require(:username).permit(:name, :password_digest)
    end

end

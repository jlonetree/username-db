class Api::V1::UsernamesController < ApplicationController
  skip_before_action :authorized, only: [:index, :create]
  before_action :set_username, only: [:show, :edit, :update, :destroy]

  # GET /usernames
  def index
    @usernames = Username.all

    render json: @usernames
  end

  # GET /usernames/1
  # GET /usernames/1.json
  def show
    @username

    render json: @username
  end

  # POST /usernames
  def create
    @username = Username.create(username_params)

    if @username.valid?
      @token = encode_token({ username_id: @username.id })
      render json: { username: UsernameSerializer.new(@username), jwt: @token }, status: :created
    else
      render json: { error: 'failed to create user' }, status: :not_acceptable
    end

  end

  # PATCH/PUT /usernames/1
  def update

    if @username.update(username_params)
      render json: @username
    else
      render json: @username.errors, status: :unprocessable_entity
    end

  end

  # DELETE /usernames/1
  def destroy
    @username.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_username
      @username = Username.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def username_params
      params.require(:username).permit(:name, :password_digest, :email)
    end
end

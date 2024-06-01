class Api::SessionsController < ApiController
  #skip_before_action :check_client_user_token, only: [:create]

  def create
    @client_user = ClientUser.find_by_email(params[:email])
    if @client_user.present? && @client_user.authenticate(params[:password])
      token = @client_user.create_token
      session[:client_user_token] = token
      render json: { token: token }
    else
      head :unauthorized
    end
  end

  def destroy
    session[:cilent_user_token] = nil
  end
end

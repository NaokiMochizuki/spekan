class Api::UsersController < ApiController

  def index
    @users = current_client.users.search_by_params(params).page(params[:page])
  end

end

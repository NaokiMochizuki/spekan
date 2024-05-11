class Api::UsersController < ApiController

  def index
    @users = current_client.users
  end
end

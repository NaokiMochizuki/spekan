class Api::ClientUsersController < ApiController
  def me
    @client_user = current_client_user
  end
end

class Api::UsersController < ApiController
  before_action :set_user, only: [:is_valid]

  def index
    @users = current_client.users.search_by_params(params).page(params[:page])
  end

  def is_valid
    @user.assign_attributes(user_params)
    @user.valid?
  end

  private
  def user_params
    params.permit(:name, :email)
  end

  def set_user
    @user = current_client.users.find(params[:id])
  end

end

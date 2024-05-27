class Api::UsersController < ApiController
  before_action :set_user, only: [:is_valid, :show, :update, :destroy]

  def index
    @users = current_client.users.search_by_params(params).page(params[:page])
  end

  def show
  end

  def update
    @user.assign_attributes(user_params)
    @result = @user.save
  end

  def destroy
  end

  def is_valid
    @user.assign_attributes(user_params)
    @user.valid?
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end

  def set_user
    @user = current_client.users.find(params[:id])
  end

end

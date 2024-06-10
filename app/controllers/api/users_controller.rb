class Api::UsersController < ApiController
  before_action :set_user, only: [:is_valid, :show, :update, :destroy]

  def index
    @users = current_client.users.search_by_params(params).page(params[:page])
  end

  def show
    @rank = @user.rank
  end

  def update
    @user.assign_attributes(user_params)
    @result = @user.save
  end

  def destroy
    @error_msg = nil
    begin
      @result = @user.destroy!
    rescue => e
      @result = false
      @error_msg = e.message
    end
  end

  def is_valid
    @user.assign_attributes(user_params)
    @user.valid?
  end

  def selectable_default_payways
  end

  def me
    @client_user = current_client_user
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :default_payway)
  end

  def set_user
    @user = current_client.users.find(params[:id])
  end

end

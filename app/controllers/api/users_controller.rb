class Api::UsersController < ApiController
  before_action :set_user, only: [:is_valid, :show, :update, :destroy, :get_point, :lost_point]

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

  def get_point
    @point_record = @user.get_point(point_params[:value], current_client_user)
    @result = @point_record.present?
  end

  def lost_point
    @point_record = @user.lost_point(point_params[:value], current_client_user)
    @result = @point_record.present?
  end

  private
  def user_params
    params.require(:user).permit(:name,
                                 :email,
                                 :default_payway)
  end

  def point_params
    params.require(:point).permit(:value)
  end

  def set_user
    @user = current_client.users.find(params[:id])
  end

end

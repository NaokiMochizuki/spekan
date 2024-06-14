class Api::PointSettingsController < ApiController
  before_action :set_point_setting, only: [:edit, :update]

  def edit
    @point_setting = current_client_user.point_setting
  end

  def update
    @point_setting = current_client_user.point_setting
  end

  private
  def point_setting_params
    params.requires(:point_setting).permit(:is_valid, :original_name, :rate, :valid_days)
  end

  def set_point_setting
    @point_setting = PointSetting.find(params[:id])
  end
end

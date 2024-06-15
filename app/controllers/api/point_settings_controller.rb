class Api::PointSettingsController < ApiController
  before_action :set_point_setting

  def show
  end

  def edit
  end

  def update
    @point_setting.assign_attributes(point_setting_params)
    @result = @point_setting.save
  end

  def is_valid
    @point_setting = PointSetting.new(point_setting_params)
    @point_setting.valid?
  end

  private
  def point_setting_params
    params.require(:point_setting).permit(:is_valid, :original_name, :rate, :valid_days)
  end

  def set_point_setting
    @point_setting = current_client.point_setting
  end
end

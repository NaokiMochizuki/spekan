class Api::PointRecordsController < ApiController

  def index
    @point_records = PointRecord.where(user_id: current_client.users).search_by_params(params).page(params[:page])
  end

end

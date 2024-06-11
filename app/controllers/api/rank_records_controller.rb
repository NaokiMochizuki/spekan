class Api::RankRecordsController < ApiController

  def index
    @rank_records = RankRecord.where(user_id: current_client.users).search_by_params(params).page(params[:page])
  end

end

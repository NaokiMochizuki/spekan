class Api::RanksController < ApiController

  def index
    @ranks = current_client.ranks.page(params[:page])
  end
end

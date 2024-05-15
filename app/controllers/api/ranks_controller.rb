class Api::RanksController < ApiController

  def index
    @ranks = current_client.ranks
  end
end

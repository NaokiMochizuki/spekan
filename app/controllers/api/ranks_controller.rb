class Api::RanksController < ApiController
  before_action :set_rank, only: [:show, :destroy]

  def index
    @ranks = current_client.ranks.page(params[:page])
  end

  def show
  end

  def destroy
    @error_msg = nil
    begin
      @result = @rank.destroy!
    rescue => e
      @result = false
      @error_msg = e.message
    end
  end

  private
  def set_rank
    @rank = current_client.ranks.find(params[:id])
  end
end

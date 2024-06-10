class Api::RanksController < ApiController
  before_action :set_rank, only: [:show, :update, :destroy, :is_valid]

  def index
    if params.has_key?(:without_page) && params[:without_page] == 'true'
      @ranks = current_client.ranks.page(1).per(current_client.ranks.count)
    else
      @ranks = current_client.ranks.page(params[:page])
    end
  end

  def show
    @rank_automation = @rank.rank_automation
  end

  def update
    @rank.assign_attributes(rank_params)
    @result = @rank.save
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

  def is_valid
    @rank.assign_attributes(rank_params)
    @rank.valid?
  end

  def selectable_automation_types
  end

  private
  def set_rank
    @rank = current_client.ranks.find(params[:id])
  end

  def rank_params
    params.require(:rank).permit(:name,
                                 :point_rate,
                                 :color,
                                 :is_default, rank_automation_attributes: [:id, :automation_type, :point, :term, :value, :_destroy])
  end
end

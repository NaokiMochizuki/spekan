class Api::RankAutomationsController < ApiController 
  before_action :set_rank_automation, only: [:update]

  def create
    @rank_automation = RankAutomation.new(rank_automation_params)
    @rank_automation.save
  end

  def update
    @rank_automation.assign_attributes(rank_automation_params)
    @result = @rank_automation.save
  end


  def is_valid
    @rank_automation = RankAutomation.new(rank_automation_params)
    @rank_automation.valid?
  end

  private
  def rank_automation_params
    params.require(:rank_automation).permit(:automation_type, :point, :term, :value, :after_rank_id)
  end

  def set_rank_automation
    @rank_automation = RankAutomation.find(params[:id])
  end
end

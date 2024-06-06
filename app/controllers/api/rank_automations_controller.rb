class Api::RankAutomationsController < ApiController

  def is_valid
    @rank_automation = RankAutomation.new(rank_automation_params)
    @rank_automation.valid?
  end

  private
  def rank_automation_params
    params.require(:rank_automation).permit(:automation_type, :point, :term, :value)
  end
end

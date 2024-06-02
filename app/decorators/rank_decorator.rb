class RankDecorator < ApplicationDecorator
  delegate_all

  def auto_promotion_setting
    return '未設定' if rank_automation.blank?
    case rank_automation.automation_type
    when 'total_amount'
      "#{rank_automation.term}日以内の合計利用金額が#{rank_automation.value}円以上"
    when 'checkin_count'
      "#{rank_automation.term}日以内の合計来店回数が#{rank_automation.value}回以上"
    end
  end

end

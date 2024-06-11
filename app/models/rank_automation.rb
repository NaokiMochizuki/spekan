class RankAutomation < ApplicationRecord
  belongs_to :before_rank, class_name: 'Rank', foreign_key: 'before_rank_id'
  belongs_to :after_rank, class_name: 'Rank', foreign_key: 'after_rank_id'
  has_many :rank_records, as: :changerable

  enum automation_type: {
    total_amount: 1,
    checkin_count: 2,
  }

  validates_presence_of :automation_type, :term, :value

  def self.check_rank_promotion
    RankAutomation.all.each do |rank_automation|
      next if last_checked_at.blank?
      next if Time.zown.now < last_checked_at + term.days
      if rank_automation.total_amount?
        rank_automation.check_total_amount_promotion
      elsif rank_automation.checkin_count?
        rank_automation.check_checkin_count_promotion
      end
    end
  end

  def check_total_amount_promotion
    # TODO: 過去term日間の利用金額がvalue円以上のユーザーを取得し、after_rankに昇格させる
    # TODO: last_checked_atを更新する
    # TODO: rank_recordsに昇格履歴を記録する
  end

  def check_checkin_count_promotion
    # TODO: 過去term日間のチェックイン回数がvalue回以上のユーザーを取得し、after_rankに昇格させる
    # TODO: last_checked_atを更新する
    # TODO: rank_recordsに昇格履歴を記録する
  end

end

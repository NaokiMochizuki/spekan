class RankAutomation < ApplicationRecord
  belongs_to :before_rank, class_name: 'Rank', foreign_key: 'before_ank_id'
  belongs_to :after_rank, class_name: 'Rank', foreign_key: 'after_ank_id'

  enum automation_type: {
    total_amount: 1,
    checkin_count: 2,
  }

  validates_presence_of :automation_type, :term, :value

end

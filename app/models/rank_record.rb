class RankRecord < ApplicationRecord
  belongs_to :before_rank, class_name: 'Rank', foreign_key: 'before_rank_id'
  belongs_to :after_rank, class_name: 'Rank', foreign_key: 'after_rank_id'
	belongs_to :changerable, polymorphic: true
	
end

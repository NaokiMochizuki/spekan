class RankRecord < ApplicationRecord
  belongs_to :before_rank, class_name: 'Rank', foreign_key: 'before_rank_id'
  belongs_to :after_rank, class_name: 'Rank', foreign_key: 'after_rank_id'
	belongs_to :changerable, polymorphic: true
  belongs_to :user
	
  scope :search_by_params, ->(params) {
    search_by_user_name(params[:name])
  }

  scope :search_by_user_name, ->(name) {
    name.present? ? where('name LIKE ?', "%#{name}%") : all
  }

end

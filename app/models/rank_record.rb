class RankRecord < ApplicationRecord
  belongs_to :before_rank, class_name: 'Rank', foreign_key: 'before_rank_id'
  belongs_to :after_rank, class_name: 'Rank', foreign_key: 'after_rank_id'
	belongs_to :changerable, polymorphic: true
  belongs_to :user
	
  scope :search_by_params, ->(params) {
    search_by_user_name(params[:user_name])
  }

  scope :search_by_user_name, ->(user_name) {
    user_name.present? ? joins(:user).where('users.name LIKE ?', "%#{user_name}%") : all
  }

end

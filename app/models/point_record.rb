class PointRecord < ApplicationRecord
  belongs_to :user
  belongs_to :eventable, polymorphic: true
  
  enum record_type: {
    increase: 1,
    decrease: 2
  }
  
  scope :search_by_params, ->(params) {
    search_by_user_name(params[:user_name])
  }

  scope :search_by_user_name, ->(user_name) {
    user_name.present? ? joins(:user).where('users.name LIKE ?', "%#{user_name}%") : all
  }
end

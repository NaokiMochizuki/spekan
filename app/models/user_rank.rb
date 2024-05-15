class UserRank < ApplicationRecord
  belongs_to :user
  belongs_to :rank

  validates :rank_id, uniqueness: { scope: :user_id }
end

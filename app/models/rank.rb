class Rank < ApplicationRecord
  acts_as_paranoid
  belongs_to :client
  has_many :user_ranks, dependent: :destroy
  has_many :users, through: :user_ranks
  has_one :rank_automation, foreign_key: 'before_rank_id'

  before_destroy :reassign_users_to_default_rank, :default_rank_is_not_deleteable!, prepend: true

  enum color: {
    gray: 1,
    silver: 2,
    gold: 3,
  }

  validates_presence_of :name

  def reassign_users_to_default_rank
    if users.present?
      default_rank = client.ranks.find_by(is_default: true)
      user_ranks.update_all(rank_id: default_rank.id)
    end
  end

  # 初期ランクの場合は削除不可
  def default_rank_is_not_deleteable!
    raise '初期ランクは削除不可です' if is_default?
  end
end

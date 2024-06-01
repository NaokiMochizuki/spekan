class Rank < ApplicationRecord
  acts_as_paranoid
  belongs_to :client
  has_many :user_ranks, dependent: :destroy
  has_many :users, through: :user_ranks

  before_destroy :reassign_users_to_default_rank, :default_rank_is_not_deleteable!

  enum color: {
    gray: 1,
    silver: 2,
    gold: 3,
  }

  validates_presence_of :name

  def reassign_users_to_default_rank
    #TODO: 削除されるランクに紐づいている顧客がいる場合、デフォルトランクに紐づけた上で削除
  end

  # 初期ランクの場合は削除不可
  def default_rank_is_not_deleteable!
    raise '初期ランクは削除不可です' if is_default?
  end
end

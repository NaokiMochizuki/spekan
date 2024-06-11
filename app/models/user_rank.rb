class UserRank < ApplicationRecord
  belongs_to :user
  belongs_to :rank

  validates :rank_id, uniqueness: { scope: :user_id }

  # ランク変更履歴を作成
  # rank_idの変更がなされたかどうかの判定をしていないので、呼び出し元で判定する
  def create_rank_record(changerable, prev_rank_id)
    return if changerable.blank?
    RankRecord.create(
      user_id: user_id,
      before_rank_id: prev_rank_id,
      after_rank_id: rank_id,
      changed_at: updated_at,
      changerable: changerable,
    )
  end
end

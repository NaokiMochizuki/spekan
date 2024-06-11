namespace :rank_automation do
  desc 'ランク自動昇格チェック'
  task check_rank_promotion: :environment do
    RankAutomation.check_rank_promotion
  end
end
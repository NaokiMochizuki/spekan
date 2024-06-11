set :output, "log/cron.log"
env :PATH, ENV['PATH']

every 1.day, at: '0:15 am'  do
  rake "rank_automation:check_rank_promotion"
end

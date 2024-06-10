json.result @result
json.error_msg @error_msg
json.set! :user_rank do
  json.id @user_rank.id
  json.user_id @user_rank.user_id
  json.rank_id @user_rank.rank_id
end

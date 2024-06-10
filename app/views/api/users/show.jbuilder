json.set! :user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
  json.default_payway @user.default_payway
end
json.set! :rank do
  json.id @rank&.id
  json.name @rank&.name
end
json.set! :user_rank do
  json.id @user.user_rank&.id
  json.user_id @user.id
  json.rank_id @user.user_rank&.rank_id
end


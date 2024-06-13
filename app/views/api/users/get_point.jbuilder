json.result @result
json.set! :user do
  json.id @user.id
  json.name @user.name
  json.email @user.email
end
json.set! :point_record do
  json.id @point_record.id
  json.record_type @point_record.record_type
  json.value @point_record.value
end



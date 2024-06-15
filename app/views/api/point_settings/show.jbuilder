json.set! :point_setting do
  json.id @point_setting.id
  json.is_valid @point_setting.is_valid
  json.original_name @point_setting.original_name
  json.rate @point_setting.rate
  json.valid_days @point_setting.valid_days
end
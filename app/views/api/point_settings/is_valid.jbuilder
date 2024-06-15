json.error_msg do
  json.is_valid @point_setting.errors[:is_valid].any? ? @point_setting.errors[:is_valid].first : nil
  json.original_name @point_setting.errors[:original_name].any? ? @point_setting.errors[:original_name].first : nil
  json.rate @point_setting.errors[:rate].any? ? @point_setting.errors[:rate].first : nil
  json.valid_days @point_setting.errors[:valid_days].any? ? @point_setting.errors[:valid_days].first : nil
end
json.error_msg do
  json.name @user.errors[:name].any? ? @user.errors[:name].first : nil
  json.email @user.errors[:email].any? ? @user.errors[:email].first : nil
end


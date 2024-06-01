json.error_msg do
  json.name @rank.errors[:name].any? ? @rank.errors[:name].first : nil
  json.color @rank.errors[:color].any? ? @rank.errors[:color].first : nil
  json.is_default @rank.errors[:is_default].any? ? @rank.errors[:is_default].first : nil
  json.point_rate @rank.errors[:point_rate].any? ? @rank.errors[:point_rate].first : nil
end



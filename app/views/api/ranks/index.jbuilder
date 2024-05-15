json.array! @ranks do |rank|
  json.id rank.id
  json.name rank.name
  json.point_rate rank.point_rate
  json.color rank.color
  json.is_default rank.is_default
  json.users_count rank.users.count
end

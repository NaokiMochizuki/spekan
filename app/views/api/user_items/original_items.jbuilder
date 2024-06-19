json.user_items do
  json.array! @user_items do |user_item|
    json.id user_item.id
    json.name user_item.name
    json.format user_item.format
  end
end
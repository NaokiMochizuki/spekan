json.user_items do
  json.array! @user_items do |user_item|
    current_user_item = current_client.client_user_items.find_by(user_item_id: user_item.id)
    json.id user_item.id
    json.name user_item.name
    json.format user_item.format
    json.is_active current_client.is_active_user_item?(user_item)
    json.required current_user_item&.required
    json.help_text current_user_item&.help_text
  end
end
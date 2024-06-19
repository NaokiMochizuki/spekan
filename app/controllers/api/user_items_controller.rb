class Api::UserItemsController < ApiController
  
  def default_items
    @user_items = UserItem.where(is_default: true)
  end

  def original_items
    @user_items = current_client.user_items.where(is_default: false)
  end
end

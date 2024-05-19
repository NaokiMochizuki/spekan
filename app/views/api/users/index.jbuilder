json.pagination do
  json.total_pages @users.total_pages
  json.current_page @users.current_page
end
json.users do
  json.array! @users do |user|
    json.id user.id
    json.name user.name
    json.email user.email
  end
end


json.pagination do
  json.total_pages @point_records.total_pages
  json.current_page @point_records.current_page
end
json.point_records do
  json.array! @point_records do |point_record|
    json.id point_record.id
    json.user_name point_record.user&.name
    json.record_type point_record.record_type
    json.value point_record.value
    json.created_at point_record.created_at
  end
end



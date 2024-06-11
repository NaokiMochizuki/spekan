json.pagination do
  json.total_pages @rank_records.total_pages
  json.current_page @rank_records.current_page
end
json.rank_records do
  json.array! @rank_records do |rank_record|
    json.id rank_record.id
    json.user_name rank_record.user&.name
    json.before_rank_name rank_record.before_rank&.name
    json.after_rank_name rank_record.after_rank&.name
    json.changed_at rank_record.changed_at
  end
end


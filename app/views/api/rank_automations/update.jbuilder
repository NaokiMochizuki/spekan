json.result @result
json.set! :rank_automation do
  json.id @rank_automation.id
  json.automation_type @rank_automation.automation_type
  json.value @rank_automation.value
  json.term @rank_automation.term
  json.after_rank_id @rank_automation.after_rank_id
end
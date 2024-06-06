json.error_msg do
  json.automation_type @rank_automation.errors[:automation_type].any? ? @rank_automation.errors[:automation_type].first : nil
  json.value @rank_automation.errors[:value].any? ? @rank_automation.errors[:value].first : nil
  json.term @rank_automation.errors[:term].any? ? @rank_automation.errors[:term].first : nil
end




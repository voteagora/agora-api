json.meta do
  json.current_page @delegates.current_page
  json.total_pages @delegates.total_pages
  json.page_size @delegates.limit_value
  json.total_count @delegates.total_count
end

json.delegates @delegates_to_return do |delegate|
  json.id delegate["id"]
  json.address delegate["address"]
  json.token delegate["token"]
  json.total_voting_power delegate["total_voting_power"]
  json.number_of_delegators delegate["number_of_delegators"]
  json.number_of_delegatees delegate["number_of_delegatees"]
end

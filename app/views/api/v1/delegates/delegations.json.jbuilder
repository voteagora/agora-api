json.meta do
  json.current_page @delegations.current_page
  json.total_pages @delegations.total_pages
  json.page_size @delegations.limit_value
  json.total_count @delegations.total_count
end

json.delegates @delegations do |delegation|
  json.id delegate["id"]
  json.address delegate["address"]
  json.token delegate["token"]
  json.total_voting_power delegate["total_voting_power"]
  json.number_of_delegators delegate["number_of_delegators"]
  json.number_of_delegatees delegate["number_of_delegatees"]
end

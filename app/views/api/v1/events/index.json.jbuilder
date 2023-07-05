json.meta do
  json.current_page @events.current_page
  json.total_pages @events.total_pages
  json.page_size @events.limit_value
  json.total_count @events.total_count
end

json.events @events do |event|
  json.id event.id
  json.token event.token
  json.address event.address
  json.kind event.kind
  json.event_data event.event_data
end

json.meta do
  json.current_page @votes.current_page
  json.total_pages @votes.total_pages
  json.page_size @votes.limit_value
  json.total_count @votes.total_count
end

json.votes @votes do |vote|
  json.id vote.id
  json.address vote.address
  json.proposal_id vote.proposal_id
  json.support vote.support
  json.amount vote.amount
  json.reason vote.reason
  json.created_at vote.created_at
end

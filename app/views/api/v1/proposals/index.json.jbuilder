json.meta do
  json.current_page @proposals.current_page
  json.total_pages @proposals.total_pages
  json.page_size @proposals.limit_value
  json.total_count @proposals.total_count
end

json.proposals @proposals do |proposal|
  json.id proposal.id
  json.uuid proposal.uuid
  json.proposer_addr proposal.proposer_addr
  json.targets proposal.targets
  json.values proposal.values
  json.token proposal.token
  json.signatures proposal.signatures
  json.calldata proposal.calldata
  json.start_block proposal.start_block
  json.end_block proposal.end_block
  json.description proposal.description
  json.kind proposal.kind
  json.created_at proposal.created_at
  if proposal.proposal_stats.present?
    json.quorum proposal.proposal_stats.last.quorum
    json.status proposal.proposal_stats.last.status
  end
end

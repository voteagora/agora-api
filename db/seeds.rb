# Cleanup
Dao.delete_all
Balance.delete_all
Proposal.delete_all
ProposalStat.delete_all
User.delete_all
Vote.delete_all
Delegation.delete_all
EnsRecord.delete_all

# Load Up Uniswap
uniswap = Dao.create!(name: "uniswap", token: "UNI")

# Load some fake Users
1000.times.each do
    User.create!(address: Faker::Blockchain::Ethereum.address)
end

# Load some fake ENS records, but not all of them
500.times.each do 
    user = User.all.sample
    EnsRecord.create!(address: user.address, username: Faker::Internet.username(specifier: 5..8,  separators: nil) + ".eth")
end

# Make some people rich!
User.all.each do |user|
    Balance.create!(address: user.address, token: uniswap.token, amount: rand(10000)+ rand.round(4))
end

# Fake some delegations
# Need to handle delegation revocation
250.times.each do 
    delegator, delegatee = User.all.sample(2)
    unless delegator.address == delegatee.address || Delegation.where(delegator_addr: delegator.address, token: uniswap.token).exists?
        Delegation.create!(delegator_addr: delegator.address, delegatee_addr: delegatee.address, amount: delegator.get_current_balance(uniswap.token), token: uniswap.token)
    end
end


# Build some fake proposals
50.times.each do
    start_block = rand(1000000) + 12000
    end_block = start_block + rand(10000) + 1200
    proposal_attrs = {
        uuid: SecureRandom.uuid,
        proposer_addr: User.all.sample.address,
        token: uniswap.token,
        targets: ["0x0000000000000000000000000000000000000000", "0x0000000000000000000000000000000000000000"],
        values: ["0", "0"] ,
        signatures: ["", ""],
        calldata: ["0x", "0x"],
        start_block: start_block,
        end_block: end_block,
        description: Faker::Lorem.paragraph,
    }
    proposal = Proposal.create!(proposal_attrs)
    proposal_stat_attrs = {
        proposal_uuid: proposal.uuid,
        token: uniswap.token,
        quorum: 2000 + rand(1000.0).to_f,
        status: ["ACTIVE", "ACTIVE", "ACTIVE", "ACTIVE", "ACTIVE", "CANCELLED", "DEFEATED", "EXECUTED", "PENDING", "QUEUED", "SUCCEEDED", "FAILED"].sample,
    }
    ProposalStat.create!(proposal_stat_attrs)
end

Proposal.all.each do |proposal|
    # Cast some votes
    User.all.sample(200).each do |user|
        vote_attrs = {
            address: user.address,
            proposal_uuid: proposal.uuid,
            token: proposal.token,
            support: [1,1,1,0,0,0,-1].sample,
            amount: user.get_current_voting_power(uniswap.token),
            reason: Faker::Lorem.paragraph
        }
        Vote.create!(vote_attrs)
    end
end




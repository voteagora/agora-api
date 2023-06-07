# Cleanup
puts "Cleaning up old data..."
Dao.delete_all
Balance.delete_all
Proposal.delete_all
ProposalStat.delete_all
User.delete_all
Vote.delete_all
Delegation.delete_all
EnsRecord.delete_all
ApiUser.delete_all
puts "Done cleaning up old data..."

puts "Loading up some fake data..."

# Load Up Uniswap
uniswap = Dao.create!(name: "uniswap", token: "UNI", chain: "L1 Ethereum")
optimism = Dao.create!(name: "optimism", token: "OP", chain: "L2 Optimism")

puts "Building fake users..."
# Load some fake Users
1000.times.each do
    User.create!(address: Faker::Blockchain::Ethereum.address)
end

puts "Building fake ENS Records..."
# Load some fake ENS records, but not all of them
700.times.each do 
    user = User.all.sample
    EnsRecord.create!(address: user.address, username: Faker::Internet.username(specifier: 5..8,  separators: nil) + ".eth")
end

Dao.all.each do |dao|


    puts "Building fake Balances for #{dao.name}..."

    # Make some people rich!
    User.all.each do |user|
        Balance.create!(address: user.address, token: dao.token, amount: rand(10000)+ rand.round(4))
    end

    puts "Building fake delegations for #{dao.name}..."
    # Fake some token delegations
    # Need to handle delegation revocation
    250.times.each do 
        delegator, delegatee = User.all.sample(2)
        unless delegator.address == delegatee.address || Delegation.where(delegator_addr: delegator.address, token: dao.token).exists?
            Delegation.create!(delegator_addr: delegator.address, delegatee_addr: delegatee.address, amount: delegator.get_current_voting_power(dao.token), token: dao.token)
        end
    end

    # Fake some liquid delegations

    if dao.name == "optimism"
        112.times.each do 
            delegator, delegatee = User.all.sample(2)
            unless delegator.address == delegatee.address || Delegation.where(delegator_addr: delegator.address, token: dao.token).exists?
                Delegation.create!(delegator_addr: delegator.address, delegatee_addr: delegatee.address, amount: delegator.get_current_voting_power(dao.token), token: dao.token, kind: "liquid") 
            end
        end
    end


    puts "Building fake proposals for #{dao.name}..."

    # Build some fake proposals
    50.times.each do
        start_block = rand(1000000) + 12000
        end_block = start_block + rand(10000) + 1200
        proposal_attrs = {
            uuid: SecureRandom.uuid,
            proposer_addr: User.all.sample.address,
            token: dao.token,
            targets: ["0x0000000000000000000000000000000000000000", "0x0000000000000000000000000000000000000000"],
            values: ["0", "0"],
            signatures: ["", ""],
            calldata: ["0x", "0x"],
            start_block: start_block,
            end_block: end_block,
            description: Faker::Lorem.paragraph,
        }
        proposal = Proposal.create!(proposal_attrs)
        proposal_stat_attrs = {
            proposal_uuid: proposal.uuid,
            token: dao.token,
            quorum: 2000 + rand(1000.0).to_f,
            status: ["ACTIVE", "ACTIVE", "ACTIVE", "ACTIVE", "ACTIVE", "CANCELLED", "DEFEATED", "EXECUTED", "PENDING", "QUEUED", "SUCCEEDED", "FAILED"].sample,
        }
        ProposalStat.create!(proposal_stat_attrs)
    end

    puts "Building fake votes for the proposals in #{dao.name}..."

    Proposal.all.each do |proposal|
        # Cast some votes
        User.all.sample(200).each do |user|
            random_number = rand(1..3)
            reason_value = random_number == 1 ? Faker::Lorem.paragraph : nil
            vote_attrs = {
                address: user.address,
                proposal_uuid: proposal.uuid,
                token: proposal.token,
                support: [1,1,1,0,0,0,-1].sample,
                amount: user.get_current_voting_power(dao.token),
                reason: reason_value
            }
            Vote.create!(vote_attrs)
        end
    end

end

puts "Done loading up some fake data."

puts "Building proposal stats for all proposals..."

Proposal.all.each do |proposal|

    proposal_stat = ProposalStat.where(proposal_uuid: proposal.uuid).first

    proposal_stat_attrs = {
        total_votes: proposal.votes.count,
        total_voting_power: proposal.votes.sum(:amount),
        total_voting_power_used: proposal.votes.where.not(support: 0).sum(:amount),
        total_voting_power_not_used: proposal.votes.where(support: 1).sum(:amount),
        total_votes_abstain: proposal.votes.where(support: -1).count,
        total_votes_against: proposal.votes.where(support: 0).count,
        total_votes_for: proposal.votes.where(support: 1).count,
        total_votes_with_reason: proposal.votes.where(support: 1).where.not(reason: nil).count,
        total_voting_power_abstain: proposal.votes.where(support: -1).sum(:amount),
        total_voting_power_no: proposal.votes.where(support: 0).sum(:amount),
        total_voting_power_yes: proposal.votes.where(support: 1).sum(:amount),
        total_voting_power_abstain_percent: proposal.votes.where(support: -1).sum(:amount) / proposal.votes.sum(:amount),
        total_voting_power_no_percent: proposal.votes.where(support: 0).sum(:amount) / proposal.votes.sum(:amount),
        total_voting_power_yes_percent: proposal.votes.where(support: 1).sum(:amount) / proposal.votes.sum(:amount),
        quorum_percent: 20.0,
        quorum_reached: true
    }
    
    proposal_stat.update(proposal_stat_attrs)

end

puts "Building balance stats for all users"

User.all.each do |user|
    user.balances.each do |balance|
        address_stat_attrs = {
            address: user.address,
            token: balance.token,
            tokens_owned: balance.amount,
            tokens_delegated: user.get_delegated_balance(balance.token),
            tokens_partial_delegated: user.get_partial_delegated_balance(balance.token),
            tokens_liquid_delegated: user.get_liquid_delegated_balance(balance.token),
            total_voting_power: user.get_current_voting_power(balance.token),
            number_of_delegatees: user.get_delegatees(balance.token).count,
            number_of_delegators: user.get_delegators(balance.token).count,
        }
        AddressStat.create!(address_stat_attrs)
    end
end


puts "Creating API Users..."
ApiUser.create!(name: "Dev Agora Key")



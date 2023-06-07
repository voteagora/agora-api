class Api::V1::DelegationsController < ApiBaseController

  def delegates_by_token
    puts params[:token]
    @delegates = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token", token: params[:token].upcase).order(total_voting_power: :desc).limit(100)
    render json: @delegates.as_json(only: [:address, :token, :total_voting_power])
  end
  
end

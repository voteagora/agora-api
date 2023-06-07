class Api::V1::DelegationsController < ApiBaseController

  def delegates_by_token
    @delegates = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0").where("balances.token = :token", token: params[:token].upcase).order(total_voting_power: :desc)
    render json: @delegates
  end
  
end

class Api::V1::DelegationsController < ApiBaseController

  # GET "/gov/:token/delegates"
  # Returns a list of delegates for a given token
  # Default sort by voting power, other sorts available
  def delegates_by_token
    delegates_to_return = {}
    if params[:sort].nil?
      delegates = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token", token: params[:token].upcase).order(total_voting_power: :desc)
      delegates_to_return = delegates.as_json(only: [:address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
    else
      # Add custom sorts here
      case params[:sort]
      when 'delegators'
        @delegates = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token", token: params[:token].upcase).order(number_of_delegators: :desc)
        delegates_to_return = @delegates.as_json(only: [:address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
      else
        delegates_to_return = {error: "Invalid sort parameter"}
      end
    end
    render json: delegates_to_return
  end
  
end

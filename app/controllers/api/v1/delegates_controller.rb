#
class Api::V1::DelegatesController < ApiBaseController

  # GET "/gov/:token/delegates"
  # Returns a list of delegates for a given token
  # Default sort by voting power, other sorts available
  def delegates_by_token
    delegates_to_return = {}
    if params[:sort].nil?
      delegates = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token", token: params[:token].upcase).order(total_voting_power: :desc)
      delegates_to_return = delegates.as_json(only: [:id, :address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
    else
      # Add custom sorts here
      case params[:sort]
      when "delegators"
        @delegates = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token", token: params[:token].upcase).order(number_of_delegators: :desc)
        delegates_to_return = @delegates.as_json(only: [:id, :address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
      else
        delegates_to_return = { error: "Invalid sort parameter" }
      end
    end
    render json: delegates_to_return
  end

  # GET "/gov/:token/delegates/:address"
  # Returns a delegate for a given token and address
  def show
    delegate = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token address_stats.address = :address", { token: params[:token].upcase, address: params[:address] }).last
    if delegate.nil?
      render json: { error: "Address not found" }, status: :not_found
      return
    else
      render json: delegate.as_json(only: [:id, :address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
    end
  end
end

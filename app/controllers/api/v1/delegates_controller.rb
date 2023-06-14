#
class Api::V1::DelegatesController < ApiBaseController

  # GET "/gov/:token/delegates"
  # Returns a list of delegates for a given token
  # Default sort by voting power, other sorts available
  def delegates_by_token
    @delegates = AddressStat.left_outer_joins(:balance)
      .where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token", token: params[:token].upcase)

    if params[:sort] == "delegators"
      @delegates = @delegates.order(number_of_delegators: :desc)
    elsif params[:sort].present?
      return render json: { error: "Invalid sort parameter" }, status: 400
    else
      @delegates = @delegates.order(total_voting_power: :desc)
    end

    @delegates = @delegates.page(params[:page]).per(50)
    @delegates_to_return = @delegates.as_json(only: [:id, :address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
    render :delegates_by_token
  end

  # GET "/gov/:token/delegates/:address"
  # Returns a delegate for a given token and address
  def show
    delegate = AddressStat.left_outer_joins(:balance).where("total_voting_power > 0 and address_stats.token = :token and balances.token = :token and address_stats.address = :address", { token: params[:token].upcase, address: params[:address] }).last
    if delegate.nil?
      render json: { error: "Address not found" }, status: :not_found
      return
    else
      render json: delegate.as_json(only: [:id, :address, :token, :total_voting_power, :number_of_delegators, :number_of_delegatees])
    end
  end
end

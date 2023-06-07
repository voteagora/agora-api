class Api::V1::DelegationsController < ApiBaseController

  def delegates_by_token
    @delegates = Delegation.where(token: params[:token]).
    render json: @proposals.as_json(include: { proposal_stats: { only: [:status, :quorum] } })
  end
  
end

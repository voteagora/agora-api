class Api::V1::ProposalsController < ApiBaseController


  # GET /proposals
  def index
    @proposals = Proposal.all
    render json: @proposals.as_json(include: { proposal_stats: { only: [:status, :quorum] } })
  end

  # GET /proposals/:uuid
  def show
    @proposal = Proposal.find_by_uuid(params[:uuid])
    if @proposal.nil?
      render json: { error: "Proposal not found" }, status: :not_found
      return
    else
     render json: @proposal.as_json(include: :proposal_stats )
    end
  end

  # GET /proposals/:uuid/votes
  def votes
    @proposal = Proposal.find_by_uuid(params[:uuid])
    if @proposal.nil?
      render json: { error: "Proposal not found" }, status: :not_found
      return
    else
      @votes = @proposal.votes
      render json: @votes
    end
  end

end

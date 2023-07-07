class Api::V1::ProposalsController < ApiBaseController

  # GET /proposals
  def index
    @proposals = Proposal.all.page(params[:page]).per(25)
    render :index
  end

  # GET /proposals/:uuid
  def show
    @proposal = Proposal.find_by_uuid(params[:uuid])
    if @proposal.nil?
      render json: { error: "Proposal not found" }, status: :not_found
      return
    else
      render json: @proposal.as_json(include: :proposal_stats)
    end
  end

  # GET proposals/search/:term
  def search
    @proposals = Proposal.search(params[:term]).page(params[:page]).per(25)
    render :index
  end

  # GET /proposals/:uuid/votes
  def votes
    @proposal = Proposal.find_by_uuid(params[:uuid])
    if @proposal.nil?
      render json: { error: "Proposal not found" }, status: :not_found
      return
    else
      @votes = @proposal.votes.page(params[:page]).per(25)
      render :votes
    end
  end

  # GET /delegates/:address/proposals/needs_vote
  # Params: token (required)
  # Params: address (required)
  # Returns list of proposals that need the delegate's vote
  def proposals_needs_vote
    user = User.find_by_address(params[:address])
    voted_proposal_ids = user.votes.pluck(:proposal_uuid)
    @proposals = Proposal.where.not(uuid: voted_proposal_ids).where(token: params[:token].upcase).page(params[:page]).per(25)
    render :index
  end

  # GET /delegates/:address/proposals/already_voted
  # Params: token (required)
  # Params: address (required)
  # Returns list of proposals that the delegate has already voted on
  def proposals_already_voted
    user = User.find_by_address(params[:address])
    @proposals = user.voted_proposals.where(token: params[:token].upcase).page(params[:page]).per(25)
    render :index
  end
end

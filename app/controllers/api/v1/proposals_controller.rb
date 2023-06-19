class Api::V1::ProposalsController < ApiBaseController


  # GET /proposals
  def index
    @proposals = Proposal.all.page(params[:page]).per(5)
    render :index
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

end

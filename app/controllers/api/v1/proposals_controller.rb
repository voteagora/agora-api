class Api::V1::ProposalsController < ApplicationController


  # GET /proposals
  def index
    @proposals = Proposal.all
    render json: @proposals
  end

  # GET /proposals/:uuid
  def show
    @proposal = Proposal.find_by_uuid(params[:uuid])
    if @proposal.nil?
      render json: { error: "Proposal not found" }, status: :not_found
      return
    else
     render json: @proposal
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

class Api::V1::ProposalsController < ApplicationController


  # GET /proposals
  def index
    @proposals = Proposal.all
    render json: Jbuilder.new { |json| json.data @proposals }.target!
  end

  # GET /proposals/:uuid
  def show
    @proposal = Proposal.find_by_uuid(params[:uuid])
    if @proposal.nil?
      render json: { error: "Proposal not found" }, status: :not_found
      return
    else
     render json: Jbuilder.new { |json| json.data @proposal }.target!
    end
  end

end

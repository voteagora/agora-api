class DelegationsController < ApplicationController
  before_action :set_delegation, only: %i[ show update destroy ]

  # GET /delegations
  def index
    @delegations = Delegation.all

    render json: @delegations
  end

  # GET /delegations/1
  def show
    render json: @delegation
  end

  # POST /delegations
  def create
    @delegation = Delegation.new(delegation_params)

    if @delegation.save
      render json: @delegation, status: :created, location: @delegation
    else
      render json: @delegation.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /delegations/1
  def update
    if @delegation.update(delegation_params)
      render json: @delegation
    else
      render json: @delegation.errors, status: :unprocessable_entity
    end
  end

  # DELETE /delegations/1
  def destroy
    @delegation.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_delegation
      @delegation = Delegation.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def delegation_params
      params.require(:delegation).permit(:delegator_addr, :delegatee_addr, :token, :amount, :status)
    end
end

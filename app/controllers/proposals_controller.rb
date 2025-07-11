# app/controllers/proposals_controller.rb
class ProposalsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_proposal, only: %i[show edit update destroy]
  after_action :verify_authorized

  def index
    @proposals = policy_scope(Proposal).includes(:organization).select do |p|
      p.age_group == current_user.determine_age_group
    end
    authorize Proposal
  end

  def new
    @proposal = Proposal.new
    authorize @proposal
  end

  def create
    @proposal = Proposal.new(proposal_params)
    authorize @proposal
    if @proposal.save
      redirect_to @proposal, notice: 'Proposal created successfully.'
    else
      render :new
    end
  end

  def show; end
  def edit; end
  def update; end
  def destroy; end

  private

  def set_proposal
    @proposal = Proposal.find(params[:id])
    authorize @proposal
  end

  def proposal_params
    params.require(:proposal).permit(:title, :description, :organization_id, :age_group)
  end
end

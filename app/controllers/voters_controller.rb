class VotersController < ApplicationController
  before_action :set_voter, only: [:show, :update, :destroy]

  # GET /voters
  # GET /voters.json
  def index
    @voters = Voter.all

    render json: @voters
  end

  # GET /voters/1
  # GET /voters/1.json
  def show
    render json: @voter
  end

  # POST /voters
  # POST /voters.json
  def create
    @voter = Voter.new(voter_params)

    if @voter.save
      render json: @voter, status: :created, location: @voter
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /voters/1
  # PATCH/PUT /voters/1.json
  def update
    @voter = Voter.find(params[:id])

    if @voter.update(voter_params)
      head :no_content
    else
      render json: @voter.errors, status: :unprocessable_entity
    end
  end

  # DELETE /voters/1
  # DELETE /voters/1.json
  def destroy
    @voter.destroy

    head :no_content
  end

  private

    def set_voter
      @voter = Voter.find(params[:id])
    end

    def voter_params
      params.require(:voter).permit(:name, :email, :dateOfBirth, :phone)
    end
end

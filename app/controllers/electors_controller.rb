class ElectorsController < ApplicationController
  before_action :set_elector, only: [:show, :update, :destroy]

  # GET /electors
  # GET /electors.json
  def index
    @electors = Elector.all

    render json: @electors
  end

  # GET /electors/1
  # GET /electors/1.json
  def show
    render json: @elector
  end

  # POST /electors
  # POST /electors.json
  def create
    @elector = Elector.new(elector_params)

    if @elector.save
      render json: @elector, status: :created, location: @elector
    else
      render json: @elector.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /electors/1
  # PATCH/PUT /electors/1.json
  def update
    @elector = Elector.find(params[:id])

    if @elector.update(elector_params)
      head :no_content
    else
      render json: @elector.errors, status: :unprocessable_entity
    end
  end

  # DELETE /electors/1
  # DELETE /electors/1.json
  def destroy
    @elector.destroy

    head :no_content
  end

  private

    def set_elector
      @elector = Elector.find(params[:id])
    end

    def elector_params
      params.require(:elector).permit(:elector_id, :last_name, :first_name, :middle_name, :gender, :dob_year, :dob_month, :dob_day, :address_number, :address_number_suffix, :unit_number, :street_name, :street_type, :street_direction, :place, :province, :postal_code, :rural_address_line, :mailing_address_line_1, :mailing_address_line_2, :mailing_place, :mailing_province, :mailing_postal_code, :mailing_country_code, :ed_id, :english_name, :poll_name, :create_date, :modify_date)
    end
end

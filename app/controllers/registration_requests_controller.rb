class RegistrationRequestsController < ApplicationController
  before_action :set_registration_request, only: [:show, :update, :destroy]

  # GET /registration_requests
  # GET /registration_requests.json
  def index
    @registration_requests = RegistrationRequest.all

    render json: @registration_requests
  end

  # GET /registration_requests/1
  # GET /registration_requests/1.json
  def show
    render json: @registration_request
  end

  # POST /registration_requests
  # POST /registration_requests.json
  def create
    @registration_request = RegistrationRequest.new(registration_request_params)

    if @registration_request.save
      render json: @registration_request, status: :created, location: @registration_request
    else
      render json: @registration_request.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /registration_requests/1
  # PATCH/PUT /registration_requests/1.json
  def update
    @registration_request = RegistrationRequest.find(params[:id])

    if @registration_request.update(registration_request_params)
      head :no_content
    else
      render json: @registration_request.errors, status: :unprocessable_entity
    end
  end

  # DELETE /registration_requests/1
  # DELETE /registration_requests/1.json
  def destroy
    @registration_request.destroy

    head :no_content
  end
  
  

  private

    def set_registration_request
      @registration_request = RegistrationRequest.find(params[:id])
    end

    def registration_request_params
      params.require(:registration_request).permit(:elector_id, :last_name, :first_name, :middle_name, :gender, :dob_year, :dob_month, :dob_day, :address_number, :address_number_suffix, :unit_number, :street_name, :street_type, :street_direction, :place, :province, :postal_code, :rural_address_line, :mailing_address_line_1, :mailing_address_line_2, :mailing_place, :mailing_province, :mailing_postal_code, :mailing_country_code, :request_status, :request_date, :request_uid, :modify_date)
    end
end

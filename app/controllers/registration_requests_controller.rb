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
    @registationData = params[:voter_records_request][:voter_registration]
  	@nameRequestData = @registationData[:name]
  	@addressRequestData = @registationData[:registration_address][:numbered_thoroughfare_address]
  	@mailingAddressRequestData = @registationData[:mailing_address][:unstructured_thoroughfare_address]
  	@dobRequestData = @registationData[:date_of_birth].split('-')
  	
  	
    @registration_request = RegistrationRequest.new
    
   	#Name
    @registration_request.last_name = @nameRequestData[:last_name]
    @registration_request.first_name = @nameRequestData[:first_name]
    @registration_request.middle_name = @nameRequestData[:middle_name]
    
    #Gender
    @registration_request.gender = @registationData[:gender]
    
    #DOB
    @registration_request.dob_year = @dobRequestData[0]
    @registration_request.dob_month = @dobRequestData[1]
    @registration_request.dob_day = @dobRequestData[2]
    
    #Address
    @addressRequestData = @registationData[:registration_address][:numbered_thoroughfare_address]
    @registration_request.address_number = @addressRequestData[:complete_address_number][:address_number]
    #TODO
    #@registration_request.address_number_suffix =
    @registration_request.unit_number = @addressRequestData[:complete_sub_address][:sub_address]
    @registration_request.street_name = @addressRequestData[:complete_street_name][:street_name]
    @registration_request.street_type = @addressRequestData[:complete_street_name][:street_name_post_type]
    @registration_request.street_direction = @addressRequestData[:complete_street_name][:street_name_post_directional]
    #TODO
    #"complete_place_names": [
    #          {
    #            "place_name_type": "MunicipalJurisdiction",
    #            "place_name_value": "Stittsville"
    #          },
    #          {
    #            "place_name_type": "County",
    #            "place_name_value": "Carleton"
    #          }
    #        ]
    #@registration_request.place =
    @registration_request.province = @addressRequestData[:state]
    @registration_request.postal_code = @addressRequestData[:zip_code]
    #TODO 
    #@registration_request.rural_address_line = 
    @registration_request.mailing_address_line_1 = @mailingAddressRequestData[:address_lines][0]
    @registration_request.mailing_address_line_2 = @mailingAddressRequestData[:address_lines][1]
    @registration_request.mailing_place = @mailingAddressRequestData[:complete_place_names][0][:place_name_value]
    @registration_request.mailing_province = @mailingAddressRequestData[:state]
    @registration_request.mailing_postal_code = @mailingAddressRequestData[:zip_code]
    #TODO
    #@registration_request.mailing_country_code =
    
    #Request state
    @registration_request.request_status = "new"
    @registration_request.request_date = params[:voter_records_request][:generated_date]
    #TODO
    #@registration_request.request_uid = 
    @registration_request.modify_date = Date.today

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
      params.require(:voter_records_request).permit(:elector_id, :last_name, :first_name, :middle_name, :gender, :dob_year, :dob_month, :dob_day, :address_number, :address_number_suffix, :unit_number, :street_name, :street_type, :street_direction, :place, :province, :postal_code, :rural_address_line, :mailing_address_line_1, :mailing_address_line_2, :mailing_place, :mailing_province, :mailing_postal_code, :mailing_country_code, :request_status, :request_date, :request_uid, :modify_date)
    end
end

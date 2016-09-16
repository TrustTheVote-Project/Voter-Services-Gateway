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
  
  

  def lookup
  	# case insensitive?
  	# handle missing params
  	# check for "type": "lookup"?
  	@nameRequestData = params[:voter_records_request][:voter_registration][:name]
  	@addressRequestData = params[:voter_records_request][:voter_registration][:registration_address][:numbered_thoroughfare_address]
  	@dobRequestData = params[:voter_records_request][:voter_registration][:date_of_birth].split('-')
  	
	@elector = Elector.find_by(first_name: @nameRequestData[:first_name], 
								last_name: @nameRequestData[:last_name], 
								address_number: @addressRequestData[:complete_address_number][:address_number], 
								street_name: @addressRequestData[:complete_street_name][:street_name],
								dob_year: @dobRequestData[0], 
								dob_month: @dobRequestData[1],  
								dob_day: @dobRequestData[2])
								
	if @elector
		@response = Hash.new("voter_records_response")
		
		@response = { "voter_records_response" => {
				"registration_success" => {
						"action"=>"registration-matched",
						"voter_registration"=>{
				  			"registration_address"=>{
				    			"numbered_thoroughfare_address"=>{
				      				"complete_address_number"=>{
				          				"address_number"=>@elector[:address_number]
				      				},
				      				"complete_street_name"=>{
				          				"street_name"=>@elector[:street_name],
				          				"street_name_post_type"=>@elector[:street_type],
				          				"street_name_post_directional"=>@elector[:street_direction]
				      				},
				      				"complete_sub_address"=>{
				        				"sub_address_type"=>"FIX_ME", #what is this?
				        				"sub_address"=>@elector[:unit_number]
				      				},
				      				"complete_place_names"=>[
										{
										  "place_name_type"=>"MunicipalJurisdiction",
										  "place_name_value"=>@elector[:place]
										},
										{
										  "place_name_type"=>"County",
										  "place_name_value"=>"FIX_ME" #what is this
										}
								  	],
								  	"state"=>@elector[:province],
				      				"zip_code"=>@elector[:postal_code]
				      			}
				      		},
				      		"registration_address_is_mailing_address"=>true,
					  		"name"=>{
								"first_name"=>@elector[:first_name],
								"last_name"=>@elector[:last_name],
								"middle_name"=>@elector[:middle_name],
								"title_prefix"=>"NO_DATA", # NO_DATA
								"title_suffix"=>"NO_DATA" # NO_DATA
							},
							"gender"=>@elector[:gender],
							"voter_ids"=>[
								{
								  "type"=>"drivers_license",
								  "attest_no_such_id"=>false
								},
								{
								  "type"=>"other",
								  "othertype"=>"elector_id",
								  "string_value"=>@elector[:elector_id],
								  "attest_no_such_id"=>false
								}
				  			],
				  			"voter_classifications"=>[
							  	"citizen",
							  	"resident-of-ontario"
							 ],
							 "contact_methods"=>[
							 	{
								  "type"=>"phone",
								  "value"=>"NO_DATA", #NO_DATA
								  "capabilities"=>[
									"voice",
									"fax",
									"sms"
								  ]
								},
								{
								  "type"=>"email",
								  "value"=>"NO_DATA" #NO_DATA
								}
							  ]
				      	}
				     }
				 }
		}

		render json: @response
	else
		render json: {
			voter_records_response: 
				{registration_rejection: 	
					{error: "no-match"}
				}
			}
	end
  end
  	
  private

    def set_elector
      @elector = Elector.find(params[:id])
    end

    def elector_params
      params.require(:elector).permit(:elector_id, :last_name, :first_name, :middle_name, :gender, :dob_year, :dob_month, :dob_day, :address_number, :address_number_suffix, :unit_number, :street_name, :street_type, :street_direction, :place, :province, :postal_code, :rural_address_line, :mailing_address_line_1, :mailing_address_line_2, :mailing_place, :mailing_province, :mailing_postal_code, :mailing_country_code, :ed_id, :english_name, :poll_name, :create_date, :modify_date)
    end
end

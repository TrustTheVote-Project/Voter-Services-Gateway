require 'test_helper'

class RegistrationRequestsControllerTest < ActionController::TestCase
  setup do
    @registration_request = registration_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_requests)
  end

  test "should create registration_request" do
    assert_difference('RegistrationRequest.count') do
      post :create, registration_request: { address_number: @registration_request.address_number, address_number_suffix: @registration_request.address_number_suffix, dob_day: @registration_request.dob_day, dob_month: @registration_request.dob_month, dob_year: @registration_request.dob_year, elector_id: @registration_request.elector_id, first_name: @registration_request.first_name, gender: @registration_request.gender, last_name: @registration_request.last_name, mailing_address_line_1: @registration_request.mailing_address_line_1, mailing_address_line_2: @registration_request.mailing_address_line_2, mailing_country_code: @registration_request.mailing_country_code, mailing_place: @registration_request.mailing_place, mailing_postal_code: @registration_request.mailing_postal_code, mailing_province: @registration_request.mailing_province, middle_name: @registration_request.middle_name, modify_date: @registration_request.modify_date, place: @registration_request.place, postal_code: @registration_request.postal_code, province: @registration_request.province, request_date: @registration_request.request_date, request_status: @registration_request.request_status, request_uid: @registration_request.request_uid, rural_address_line: @registration_request.rural_address_line, street_direction: @registration_request.street_direction, street_name: @registration_request.street_name, street_type: @registration_request.street_type, unit_number: @registration_request.unit_number }
    end

    assert_response 201
  end

  test "should show registration_request" do
    get :show, id: @registration_request
    assert_response :success
  end

  test "should update registration_request" do
    put :update, id: @registration_request, registration_request: { address_number: @registration_request.address_number, address_number_suffix: @registration_request.address_number_suffix, dob_day: @registration_request.dob_day, dob_month: @registration_request.dob_month, dob_year: @registration_request.dob_year, elector_id: @registration_request.elector_id, first_name: @registration_request.first_name, gender: @registration_request.gender, last_name: @registration_request.last_name, mailing_address_line_1: @registration_request.mailing_address_line_1, mailing_address_line_2: @registration_request.mailing_address_line_2, mailing_country_code: @registration_request.mailing_country_code, mailing_place: @registration_request.mailing_place, mailing_postal_code: @registration_request.mailing_postal_code, mailing_province: @registration_request.mailing_province, middle_name: @registration_request.middle_name, modify_date: @registration_request.modify_date, place: @registration_request.place, postal_code: @registration_request.postal_code, province: @registration_request.province, request_date: @registration_request.request_date, request_status: @registration_request.request_status, request_uid: @registration_request.request_uid, rural_address_line: @registration_request.rural_address_line, street_direction: @registration_request.street_direction, street_name: @registration_request.street_name, street_type: @registration_request.street_type, unit_number: @registration_request.unit_number }
    assert_response 204
  end

  test "should destroy registration_request" do
    assert_difference('RegistrationRequest.count', -1) do
      delete :destroy, id: @registration_request
    end

    assert_response 204
  end
end

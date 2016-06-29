require 'test_helper'

class VotersControllerTest < ActionController::TestCase
  setup do
    @voter = voters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:voters)
  end

  test "should create voter" do
    assert_difference('Voter.count') do
      post :create, voter: { address_number: @voter.address_number, address_number_suffix: @voter.address_number_suffix, dob_day: @voter.dob_day, dob_month: @voter.dob_month, dob_year: @voter.dob_year, elector_id: @voter.elector_id, first_name: @voter.first_name, gender: @voter.gender, last_name: @voter.last_name, mailing_address_line_1: @voter.mailing_address_line_1, mailing_address_line_2: @voter.mailing_address_line_2, mailing_country_code: @voter.mailing_country_code, mailing_place: @voter.mailing_place, mailing_postal_code: @voter.mailing_postal_code, mailing_province: @voter.mailing_province, middle_name: @voter.middle_name, modify_date: @voter.modify_date, place: @voter.place, postal_code: @voter.postal_code, province: @voter.province, request_date: @voter.request_date, request_status: @voter.request_status, request_uid: @voter.request_uid, rural_address_line: @voter.rural_address_line, street_direction: @voter.street_direction, street_name: @voter.street_name, street_type: @voter.street_type, unit_number: @voter.unit_number }
    end

    assert_response 201
  end

  test "should show voter" do
    get :show, id: @voter
    assert_response :success
  end

  test "should update voter" do
    put :update, id: @voter, voter: { address_number: @voter.address_number, address_number_suffix: @voter.address_number_suffix, dob_day: @voter.dob_day, dob_month: @voter.dob_month, dob_year: @voter.dob_year, elector_id: @voter.elector_id, first_name: @voter.first_name, gender: @voter.gender, last_name: @voter.last_name, mailing_address_line_1: @voter.mailing_address_line_1, mailing_address_line_2: @voter.mailing_address_line_2, mailing_country_code: @voter.mailing_country_code, mailing_place: @voter.mailing_place, mailing_postal_code: @voter.mailing_postal_code, mailing_province: @voter.mailing_province, middle_name: @voter.middle_name, modify_date: @voter.modify_date, place: @voter.place, postal_code: @voter.postal_code, province: @voter.province, request_date: @voter.request_date, request_status: @voter.request_status, request_uid: @voter.request_uid, rural_address_line: @voter.rural_address_line, street_direction: @voter.street_direction, street_name: @voter.street_name, street_type: @voter.street_type, unit_number: @voter.unit_number }
    assert_response 204
  end

  test "should destroy voter" do
    assert_difference('Voter.count', -1) do
      delete :destroy, id: @voter
    end

    assert_response 204
  end
end

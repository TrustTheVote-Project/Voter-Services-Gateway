require 'test_helper'

class ElectorsControllerTest < ActionController::TestCase
  setup do
    @elector = electors(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:electors)
  end

  test "should create elector" do
    assert_difference('Elector.count') do
      post :create, elector: { address_number: @elector.address_number, address_number_suffix: @elector.address_number_suffix, create_date: @elector.create_date, dob_day: @elector.dob_day, dob_month: @elector.dob_month, dob_year: @elector.dob_year, ed_id: @elector.ed_id, elector_id: @elector.elector_id, english_name: @elector.english_name, first_name: @elector.first_name, gender: @elector.gender, last_name: @elector.last_name, mailing_address_line_1: @elector.mailing_address_line_1, mailing_address_line_2: @elector.mailing_address_line_2, mailing_country_code: @elector.mailing_country_code, mailing_place: @elector.mailing_place, mailing_postal_code: @elector.mailing_postal_code, mailing_province: @elector.mailing_province, middle_name: @elector.middle_name, modify_date: @elector.modify_date, place: @elector.place, poll_name: @elector.poll_name, postal_code: @elector.postal_code, province: @elector.province, rural_address_line: @elector.rural_address_line, street_direction: @elector.street_direction, street_name: @elector.street_name, street_type: @elector.street_type, unit_number: @elector.unit_number }
    end

    assert_response 201
  end

  test "should show elector" do
    get :show, id: @elector
    assert_response :success
  end

  test "should update elector" do
    put :update, id: @elector, elector: { address_number: @elector.address_number, address_number_suffix: @elector.address_number_suffix, create_date: @elector.create_date, dob_day: @elector.dob_day, dob_month: @elector.dob_month, dob_year: @elector.dob_year, ed_id: @elector.ed_id, elector_id: @elector.elector_id, english_name: @elector.english_name, first_name: @elector.first_name, gender: @elector.gender, last_name: @elector.last_name, mailing_address_line_1: @elector.mailing_address_line_1, mailing_address_line_2: @elector.mailing_address_line_2, mailing_country_code: @elector.mailing_country_code, mailing_place: @elector.mailing_place, mailing_postal_code: @elector.mailing_postal_code, mailing_province: @elector.mailing_province, middle_name: @elector.middle_name, modify_date: @elector.modify_date, place: @elector.place, poll_name: @elector.poll_name, postal_code: @elector.postal_code, province: @elector.province, rural_address_line: @elector.rural_address_line, street_direction: @elector.street_direction, street_name: @elector.street_name, street_type: @elector.street_type, unit_number: @elector.unit_number }
    assert_response 204
  end

  test "should destroy elector" do
    assert_difference('Elector.count', -1) do
      delete :destroy, id: @elector
    end

    assert_response 204
  end
end

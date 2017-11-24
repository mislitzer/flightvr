require 'test_helper'

class FlightstatsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @flightstat = flightstats(:one)
  end

  test "should get index" do
    get flightstats_url
    assert_response :success
  end

  test "should get new" do
    get new_flightstat_url
    assert_response :success
  end

  test "should create flightstat" do
    assert_difference('Flightstat.count') do
      post flightstats_url, params: { flightstat: { Month: @flightstat.Month, Value: @flightstat.Value } }
    end

    assert_redirected_to flightstat_url(Flightstat.last)
  end

  test "should show flightstat" do
    get flightstat_url(@flightstat)
    assert_response :success
  end

  test "should get edit" do
    get edit_flightstat_url(@flightstat)
    assert_response :success
  end

  test "should update flightstat" do
    patch flightstat_url(@flightstat), params: { flightstat: { Month: @flightstat.Month, Value: @flightstat.Value } }
    assert_redirected_to flightstat_url(@flightstat)
  end

  test "should destroy flightstat" do
    assert_difference('Flightstat.count', -1) do
      delete flightstat_url(@flightstat)
    end

    assert_redirected_to flightstats_url
  end
end

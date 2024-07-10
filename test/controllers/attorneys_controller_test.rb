require "test_helper"

class AttorneysControllerTest < ActionDispatch::IntegrationTest
  setup do
    @attorney = attorneys(:one)
  end

  test "should get index" do
    get attorneys_url
    assert_response :success
  end

  test "should get new" do
    get new_attorney_url
    assert_response :success
  end

  test "should create attorney" do
    assert_difference("Attorney.count") do
      post attorneys_url, params: { attorney: { address: @attorney.address, city: @attorney.city, email: @attorney.email, firm_name: @attorney.firm_name, full_name: @attorney.full_name, old_firm_name: @attorney.old_firm_name, sbn: @attorney.sbn, state: @attorney.state, status: @attorney.status, tel: @attorney.tel, zip: @attorney.zip } }
    end

    assert_redirected_to attorney_url(Attorney.last)
  end

  test "should show attorney" do
    get attorney_url(@attorney)
    assert_response :success
  end

  test "should get edit" do
    get edit_attorney_url(@attorney)
    assert_response :success
  end

  test "should update attorney" do
    patch attorney_url(@attorney), params: { attorney: { address: @attorney.address, city: @attorney.city, email: @attorney.email, firm_name: @attorney.firm_name, full_name: @attorney.full_name, old_firm_name: @attorney.old_firm_name, sbn: @attorney.sbn, state: @attorney.state, status: @attorney.status, tel: @attorney.tel, zip: @attorney.zip } }
    assert_redirected_to attorney_url(@attorney)
  end

  test "should destroy attorney" do
    assert_difference("Attorney.count", -1) do
      delete attorney_url(@attorney)
    end

    assert_redirected_to attorneys_url
  end
end

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
      post attorneys_url, params: { attorney: { address: @attorney.address, admit_date: @attorney.admit_date, discipline: @attorney.discipline, email: @attorney.email, full_name: @attorney.full_name, law_school: @attorney.law_school, phone: @attorney.phone, sbn: @attorney.sbn, status: @attorney.status, website: @attorney.website } }
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
    patch attorney_url(@attorney), params: { attorney: { address: @attorney.address, admit_date: @attorney.admit_date, discipline: @attorney.discipline, email: @attorney.email, full_name: @attorney.full_name, law_school: @attorney.law_school, phone: @attorney.phone, sbn: @attorney.sbn, status: @attorney.status, website: @attorney.website } }
    assert_redirected_to attorney_url(@attorney)
  end

  test "should destroy attorney" do
    assert_difference("Attorney.count", -1) do
      delete attorney_url(@attorney)
    end

    assert_redirected_to attorneys_url
  end
end

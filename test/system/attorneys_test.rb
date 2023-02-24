require "application_system_test_case"

class AttorneysTest < ApplicationSystemTestCase
  setup do
    @attorney = attorneys(:one)
  end

  test "visiting the index" do
    visit attorneys_url
    assert_selector "h1", text: "Attorneys"
  end

  test "should create attorney" do
    visit attorneys_url
    click_on "New attorney"

    fill_in "Address", with: @attorney.address
    fill_in "Admit date", with: @attorney.admit_date
    fill_in "Discipline", with: @attorney.discipline
    fill_in "Email", with: @attorney.email
    fill_in "Full name", with: @attorney.full_name
    fill_in "Law school", with: @attorney.law_school
    fill_in "Phone", with: @attorney.phone
    fill_in "Sbn", with: @attorney.sbn
    fill_in "Status", with: @attorney.status
    fill_in "Website", with: @attorney.website
    click_on "Create Attorney"

    assert_text "Attorney was successfully created"
    click_on "Back"
  end

  test "should update Attorney" do
    visit attorney_url(@attorney)
    click_on "Edit this attorney", match: :first

    fill_in "Address", with: @attorney.address
    fill_in "Admit date", with: @attorney.admit_date
    fill_in "Discipline", with: @attorney.discipline
    fill_in "Email", with: @attorney.email
    fill_in "Full name", with: @attorney.full_name
    fill_in "Law school", with: @attorney.law_school
    fill_in "Phone", with: @attorney.phone
    fill_in "Sbn", with: @attorney.sbn
    fill_in "Status", with: @attorney.status
    fill_in "Website", with: @attorney.website
    click_on "Update Attorney"

    assert_text "Attorney was successfully updated"
    click_on "Back"
  end

  test "should destroy Attorney" do
    visit attorney_url(@attorney)
    click_on "Destroy this attorney", match: :first

    assert_text "Attorney was successfully destroyed"
  end
end

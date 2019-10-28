require "application_system_test_case"

class RacquetsTest < ApplicationSystemTestCase
  setup do
    @racquet = racquets(:one)
  end

  test "visiting the index" do
    visit racquets_url
    assert_selector "h1", text: "Racquets"
  end

  test "creating a Racquet" do
    visit racquets_url
    click_on "New Racquet"

    fill_in "Balance", with: @racquet.balance
    fill_in "Brand", with: @racquet.brand
    fill_in "Description", with: @racquet.description
    fill_in "Head size", with: @racquet.head_size
    fill_in "Length", with: @racquet.length
    fill_in "Status", with: @racquet.status_id
    fill_in "Stiffness", with: @racquet.stiffness
    fill_in "String pattern", with: @racquet.string_pattern
    fill_in "Strung weight", with: @racquet.strung_weight
    fill_in "Type", with: @racquet.type
    fill_in "User", with: @racquet.user_id
    click_on "Create Racquet"

    assert_text "Racquet was successfully created"
    click_on "Back"
  end

  test "updating a Racquet" do
    visit racquets_url
    click_on "Edit", match: :first

    fill_in "Balance", with: @racquet.balance
    fill_in "Brand", with: @racquet.brand
    fill_in "Description", with: @racquet.description
    fill_in "Head size", with: @racquet.head_size
    fill_in "Length", with: @racquet.length
    fill_in "Status", with: @racquet.status_id
    fill_in "Stiffness", with: @racquet.stiffness
    fill_in "String pattern", with: @racquet.string_pattern
    fill_in "Strung weight", with: @racquet.strung_weight
    fill_in "Type", with: @racquet.type
    fill_in "User", with: @racquet.user_id
    click_on "Update Racquet"

    assert_text "Racquet was successfully updated"
    click_on "Back"
  end

  test "destroying a Racquet" do
    visit racquets_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Racquet was successfully destroyed"
  end
end

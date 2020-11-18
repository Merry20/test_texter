require "application_system_test_case"

class TextersTest < ApplicationSystemTestCase
  setup do
    @texter = texters(:one)
  end

  test "visiting the index" do
    visit texters_url
    assert_selector "h1", text: "Texters"
  end

  test "creating a Texter" do
    visit texters_url
    click_on "New Texter"

    fill_in "Client name", with: @texter.client_name
    fill_in "Message description", with: @texter.message_description
    click_on "Create Texter"

    assert_text "Texter was successfully created"
    click_on "Back"
  end

  test "updating a Texter" do
    visit texters_url
    click_on "Edit", match: :first

    fill_in "Client name", with: @texter.client_name
    fill_in "Message description", with: @texter.message_description
    click_on "Update Texter"

    assert_text "Texter was successfully updated"
    click_on "Back"
  end

  test "destroying a Texter" do
    visit texters_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Texter was successfully destroyed"
  end
end

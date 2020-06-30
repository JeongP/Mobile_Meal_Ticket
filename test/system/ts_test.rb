require "application_system_test_case"

class TsTest < ApplicationSystemTestCase
  setup do
    @t = ts(:one)
  end

  test "visiting the index" do
    visit ts_url
    assert_selector "h1", text: "Ts"
  end

  test "creating a T" do
    visit ts_url
    click_on "New T"

    fill_in "Title", with: @t.title
    click_on "Create T"

    assert_text "T was successfully created"
    click_on "Back"
  end

  test "updating a T" do
    visit ts_url
    click_on "Edit", match: :first

    fill_in "Title", with: @t.title
    click_on "Update T"

    assert_text "T was successfully updated"
    click_on "Back"
  end

  test "destroying a T" do
    visit ts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "T was successfully destroyed"
  end
end

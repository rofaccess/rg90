require "application_system_test_case"

class VouchersTest < ApplicationSystemTestCase
  setup do
    @voucher = vouchers(:one)
  end

  test "visiting the index" do
    visit vouchers_url
    assert_selector "h1", text: "Vouchers"
  end

  test "should create voucher" do
    visit vouchers_url
    click_on "New voucher"

    fill_in "Business identifier", with: @voucher.business_identifier
    fill_in "Business name", with: @voucher.business_name
    fill_in "Date", with: @voucher.date
    fill_in "Number", with: @voucher.number
    fill_in "Timbrado", with: @voucher.timbrado
    fill_in "Total amount", with: @voucher.total_amount
    click_on "Create Voucher"

    assert_text "Voucher was successfully created"
    click_on "Back"
  end

  test "should update Voucher" do
    visit voucher_url(@voucher)
    click_on "Edit this voucher", match: :first

    fill_in "Business identifier", with: @voucher.business_identifier
    fill_in "Business name", with: @voucher.business_name
    fill_in "Date", with: @voucher.date
    fill_in "Number", with: @voucher.number
    fill_in "Timbrado", with: @voucher.timbrado
    fill_in "Total amount", with: @voucher.total_amount
    click_on "Update Voucher"

    assert_text "Voucher was successfully updated"
    click_on "Back"
  end

  test "should destroy Voucher" do
    visit voucher_url(@voucher)
    click_on "Destroy this voucher", match: :first

    assert_text "Voucher was successfully destroyed"
  end
end

require "test_helper"

class VouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher = vouchers(:one)
  end

  describe "GET index" do
    before { get vouchers_url }

    should "responds successfully with an HTTP 200 status code" do
      assert_response :success
    end

    should "renders the index template" do
      assert_template :index
    end

    should "load all vouchers into @vouchers" do
      assert_equal Voucher.all.size, assigns(:vouchers).size
    end
  end

  test "should get new" do
    get new_voucher_url
    assert_response :success
  end

  test "should create voucher" do
    assert_difference("Voucher.count") do
      post vouchers_url, params: { voucher: { business_identifier: @voucher.business_identifier, business_name: @voucher.business_name, date: @voucher.date, number: @voucher.number, timbrado: @voucher.timbrado, total_amount: @voucher.total_amount } }
    end

    assert_redirected_to voucher_url(Voucher.last)
  end

  test "should show voucher" do
    get voucher_url(@voucher)
    assert_response :success
  end

  test "should get edit" do
    get edit_voucher_url(@voucher)
    assert_response :success
  end

  test "should update voucher" do
    patch voucher_url(@voucher), params: { voucher: { business_identifier: @voucher.business_identifier, business_name: @voucher.business_name, date: @voucher.date, number: @voucher.number, timbrado: @voucher.timbrado, total_amount: @voucher.total_amount } }
    assert_redirected_to voucher_url(@voucher)
  end

  test "should destroy voucher" do
    assert_difference("Voucher.count", -1) do
      delete voucher_url(@voucher)
    end

    assert_redirected_to vouchers_url
  end
end

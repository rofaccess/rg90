require "test_helper"

class VouchersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @voucher = vouchers(:one)
  end

  describe "GET index" do
    before { get vouchers_url }

    should "load all vouchers into @vouchers" do
      assert_equal Voucher.all.size, assigns(:vouchers).size
    end

    should "responds with an HTTP 200 status code" do
      assert_response :success
    end

    should "renders the index template" do
      assert_template :index
    end
  end

  describe "GET new" do
    before { get new_voucher_url }

    should "load a new voucher into @voucher" do
      assert assigns(:voucher).new_record?
    end

    should "responds with an HTTP 200 status code" do
      assert_response :success
    end

    should "renders the new template" do
      assert_template :new
    end
  end

  describe "POST create" do
    context "with valid params" do
      before do
        @vouchers_count = Voucher.count
        post vouchers_url, params: { voucher: voucher_params }
      end

      should "create a new voucher" do
        assert_equal @vouchers_count + 1, Voucher.count
      end

      should "load the new voucher into @voucher" do
        assert assigns(:voucher)
      end

      should "responds with an HTTP 302 status code" do
        assert_response :found
      end

      should "redirects to the created new voucher" do
        assert_redirected_to voucher_url(assigns(:voucher))
      end
    end

    context "with invalid params" do
      before do
        voucher = Voucher.new
        voucher.expects(:save).returns(false)
        Voucher.expects(:new).returns(voucher)

        @vouchers_count = Voucher.count
        post vouchers_url, params: { voucher: voucher_params }
      end

      should "not create a new voucher" do
        assert_equal @vouchers_count, Voucher.count
      end

      should "responds with an HTTP 422 status code" do
        assert_response :unprocessable_entity
      end

      should "renders the new template" do
        assert_template :new
      end
    end
  end

  describe "GET show" do
    context "with existing voucher" do
      before do
        get voucher_url(@voucher)
      end

      should "load the voucher into @voucher" do
        assert assigns(:voucher)
      end

      should "responds with an HTTP 200 status code" do
        assert_response :success
      end

      should "renders the show template" do
        assert_template :show
      end
    end

    context "when no exist voucher" do
      should "raise ActiveRecord::RecordNotFound" do
        assert_raise ActiveRecord::RecordNotFound do
          get voucher_url(12345)
        end
      end
    end
  end

  describe "GET edit" do
    before { get edit_voucher_url(@voucher) }

    should "load the voucher into @voucher" do
      assert_equal @voucher.id, assigns(:voucher).id
    end

    should "responds with an HTTP 200 status code" do
      assert_response :success
    end

    should "renders the new template" do
      assert_template :edit
    end
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

  def voucher_params
    {
      business_identifier: @voucher.business_identifier,
      business_name: @voucher.business_name,
      date: @voucher.date,
      number: @voucher.number,
      timbrado: @voucher.timbrado,
      total_amount: @voucher.total_amount
    }
  end
end

class VouchersController < ApplicationController
  before_action :set_voucher, only: %i[ show edit update destroy ]

  # GET /vouchers or /vouchers.json
  def index
    @vouchers = Voucher.all
  end

  # GET /vouchers/1 or /vouchers/1.json
  def show
  end

  # GET /vouchers/new
  def new
    @voucher = Voucher.new
  end

  # GET /vouchers/1/edit
  def edit
  end

  # POST /vouchers or /vouchers.json
  def create
    @voucher = Voucher.new(voucher_params)

    respond_to do |format|
      if @voucher.save
        format.html { redirect_to voucher_url(@voucher), notice: "Voucher was successfully created." }
        format.json { render :show, status: :created, location: @voucher }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vouchers/1 or /vouchers/1.json
  def update
    respond_to do |format|
      if @voucher.update(voucher_params)
        format.html { redirect_to voucher_url(@voucher), notice: "Voucher was successfully updated." }
        format.json { render :show, status: :ok, location: @voucher }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @voucher.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vouchers/1 or /vouchers/1.json
  def destroy
    @voucher.destroy

    respond_to do |format|
      format.html { redirect_to vouchers_url, notice: "Voucher was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_voucher
      @voucher = Voucher.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def voucher_params
      params.require(:voucher).permit(:business_name, :business_identifier, :timbrado, :number, :date, :total_amount)
    end
end

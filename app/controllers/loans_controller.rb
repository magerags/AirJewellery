class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :destroy]


  def show
  end


  def new
    @jewellery = Jewellery.find(params[:jewellery_id])
    @loan = Loan.new
    @loans = Loan.all
  end

  def create
    @loan = Loan.new(loan_params)
    @jewellery = Jewellery.find(params[:jewellery_id])
    @loan.jewellery = @jewellery
    @loan.user = current_user
    if @loan.save
      redirect_to loan_path(@loan)
    end
  end

  def destroy
    @jewellery = @loan.jewellery
    @loan.destroy
    redirect_to jewellery_path(@jewellery)
  end

  private

  def set_loan
    @loan = Loan.find(params[:id])
  end

  def loan_params
    params.require(:loan).permit(:from, :to)
  end
end


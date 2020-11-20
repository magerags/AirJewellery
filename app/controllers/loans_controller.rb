class LoansController < ApplicationController
  before_action :set_loan, only: [:show, :destroy]

  def index
    @loans = policy_scope(Loan).where(:user => current_user)
  end

  def show
  end

  def new
    @jewellery = Jewellery.find(params[:jewellery_id])
    @loan = Loan.new
    @loans = Loan.all
    authorize @loan
  end

  def create
    @loan = Loan.new(loan_params)
    @jewellery = Jewellery.find(params[:jewellery_id])
    @loan.jewellery = @jewellery
    @loan.user = current_user
    authorize @loan
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
    authorize @loan
  end

  def loan_params
    params.require(:loan).permit(:from, :to)
  end
end

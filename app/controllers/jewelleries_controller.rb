class JewelleriesController < ApplicationController
  before_action :set_jewellery, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @jewelleries = Jewellery.where("name LIKE ?", "%#{@query}%")
    else
      @jewelleries = policy_scope(Jewellery)
    end
  end

  def listings
    @jewelleries = policy_scope(Jewellery).where(:user => current_user)
  end

  def show
    @jewellery
    @loan = Loan.new
  end

  def new
    @jewellery = Jewellery.new
    authorize @jewellery
  end

  def create
    @jewellery = Jewellery.new(jewellery_params)
    @jewellery.user = current_user
    authorize @jewellery
    if @jewellery.save
      redirect_to jewelleries_path(@jewellery)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @jewellery.update(jewellery_params)
    redirect_to jewellery_path(@jewellery)
  end

  def destroy
    @jewellery.destroy
    redirect_to jewelleries_path
  end

  private

  def jewellery_params
    params.require(:jewellery).permit(:name, :description, :price, photos: [])
  end

  def set_jewellery
    @jewellery = Jewellery.find(params[:id])
    authorize @jewellery
  end
end

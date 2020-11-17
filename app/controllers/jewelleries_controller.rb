class JewelleriesController < ApplicationController
  before_action :set_jewellery, only: [:show, :destroy]

  def index
    @jewelleries = Jewellery.all
  end

  def show
    @jewellery
  end

  def new
    @jewellery = Jewellery.new
  end

  def create
    @jewellery = Jewellery.new(jewellery_params)
    if @jewellery.save
      redirect_to jewelleries_path(@jewellery)
    else
      render :new
    end
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
  end
end

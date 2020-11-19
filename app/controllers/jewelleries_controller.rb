class JewelleriesController < ApplicationController
  before_action :set_jewellery, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @query = params[:query]
      @jewelleries = Jewellery.where("name LIKE ?", "%#{@query}%")
     else
    @jewelleries = Jewellery.all
  end
end

def listings
  @jewelleries = current_user.jewelleries
end

  def show
    @jewellery
  end

  def new
    @jewellery = Jewellery.new
  end

  def create
    @jewellery = Jewellery.new(jewellery_params)
    @jewellery.user = current_user
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
  end
end

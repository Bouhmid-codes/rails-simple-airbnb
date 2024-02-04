class FlatsController < ApplicationController
  before_action :set_flat, only: %I[edit update destroy show]

  def index
    @flats = params[:search] ? Flat.where('name LIKE ?', "%#{params[:search][:search]}%") : Flat.all
  end

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.new(flat_params)

    if @flat.save
      redirect_to flats_path
    else
      render :new, status: 422
    end
  end

  def edit; end

  def update
    if @flat.update(flat_params)
      redirect_to flats_path, status: :see_other
    else
      render :edit, status: 422
    end
  end

  def destroy
    if @flat.destroy
      redirect_to flats_path, status: :see_other
    else
      render :index, status: 422
    end
  end

  def show; end

  private

  def set_flat
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name,:address, :description, :price_per_night, :number_of_guests, :img_url)
  end
end

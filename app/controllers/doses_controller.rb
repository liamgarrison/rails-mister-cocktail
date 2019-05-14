class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

  def destroy
  end
end

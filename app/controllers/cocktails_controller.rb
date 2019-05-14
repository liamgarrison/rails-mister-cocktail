class CocktailsController < ApplicationController
  def index
    @search_term = params[:q]
    if @search_term.nil?
      @cocktails = Cocktail.all
    else
      regex = Regexp.new(@search_term, "i")
      @cocktails = Cocktail.select { |cocktail| cocktail.name.match(regex) }
    end
  end

  def show
    @cocktail = Cocktail.find(params[:id])
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'new'
    end
  end

  def cocktail_params
    params.require(:cocktail).permit(:name, :image_url)
  end
end

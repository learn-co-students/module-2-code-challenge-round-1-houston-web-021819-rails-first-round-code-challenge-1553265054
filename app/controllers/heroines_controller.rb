class HeroinesController < ApplicationController

  #Create

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params)
    @powers = Power.all
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end



  #Read

  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  #Strong Params

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

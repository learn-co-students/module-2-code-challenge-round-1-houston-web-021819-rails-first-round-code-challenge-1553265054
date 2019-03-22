class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
    @power = @heroine.power
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.create(heroine_params)
    if @heroine.valid?
      @heroine.save
    end
    redirect_to heroine_path(@heroine.id)
  end

  def heroine_params
    params.require(:heroine).permit(:name, :super_name, :power_id)
  end
end

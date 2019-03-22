class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params(:name, :super_name, :power_id))
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      @powers = Power.all
      render :new
    end
  end

  def search
    power = params.permit(:q)[:q].titleize
    if Power.all_names.include?(power)
      @heroines = Heroine.all.select{|h| h.power.name == power}
    else
      @heroines = Heroine.all
    end
    render :index
  end

  private

    def heroine_params(*args)
      params.require(:heroine).permit(*args)
    end
end

class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
  	@heroine = Heroine.find(params[:id])
  end

  def new
  	@heroine = Heroine.new
  end

  def create
  	@heroine = Heroine.new(heroine_params(:name, :power_id, :super_name))
  	if @heroine.valid?
  		@heroine.save
  		redirect_to @heroine
  	else
  		render :new
  	end
  end

  def heroine_params(*args)
  	params.require(:heroine).permit(*args)
  end
end

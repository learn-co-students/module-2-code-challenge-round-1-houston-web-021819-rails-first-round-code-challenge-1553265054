class PowersController < ApplicationController
  

  #create
  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params)
  end

  #read
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  #update
  def edit
    @power = Power.find(params[:id])
  end

  def update 
    @power = Power.find(params[:id])
    @power = Power.update(power_params)
    redirect_to '/powers'
  end

  #destroy
  def destroy
    @power = Power.find(params[:id])
    @power = Power.destroy
    redirect_to '/powers'
  end


  #strong_params
  def power_params
    params.require(:power).permit(:name, :super_name)
  end
end

class PowersController < ApplicationController
  def index
    @powers = Power.all
  end

  def show
    @power = Power.find(params[:id])
  end

  def new
    @power = Power.new(params[:id])
  end

  def create
    @power = Power.new(power_params[:power])
    if @power.valid?
       @power.save
       redirect_to @power
    else
      render :new
    end
  end

  def edit
    @power = Power.find(params[:id])    
  end

  def update
    @power = Power.find(params[:id])
    @power = @power.assign_attributes(power_params[:power])
    if @power.valid?
      @power.save
      redirect_to powers_path
    else
      render :edit
    end
  end

  def destroy
    @power = Power.find(params[:id])    
    @power.destroy
    redirect_to powers_path
  end

  private
  def power_params
    params.permit(power:[:name, :description])
  end
end

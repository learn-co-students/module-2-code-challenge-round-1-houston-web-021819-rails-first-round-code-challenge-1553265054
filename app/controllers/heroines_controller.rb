class HeroinesController < ApplicationController
  

  #create
  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params)
  end

  #read
  def index
    @heroines = Heroine.all
  end

  def show
    @heroine = Heroine.find(params[:id])
  end

  #update
  def edit
    @heroine = Heroine.find(params[:id])
  end

  def update 
    @heroine = Heroine.find(params[:id])
    @heroine = Heroine.update(heroine_params)
    redirect_to '/heroines'
  end

  #destroy
  def destroy
    @heroine = Heroine.find(params[:id])
    @heroine = Herione.destroy
    redirect_to '/heriones'
  end


  #strong_params
  def heroine_params
    params.require(:heroine).permit(:name, :super_name)
  end
end

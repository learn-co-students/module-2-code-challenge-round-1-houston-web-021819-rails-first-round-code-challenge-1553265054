class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  def show
   @h=Heroine.find(params[:id].to_i)
   @p=Power.find(@h.power_id)
  end
  def new
  end
  def create
  end
  def edit
  end
  def update

   @h=Heroine.find(params[:id].to_i)
    @
  end
  def destroy
    @h=Heroine.find(params[:id].to_i)
    redirect_to heroines_path
  end
  def heroine_params
    params.require(:heroine).permit(:name,:super_name, :power_id)
   
  end
end

class HeroinesController < ApplicationController
  def index
    @heroines = Heroine.all
  end

  #search function.not working now.
  def search_power
    Heroine.all.where('name LIKE ?', "%#{self.power.name}%")
    redirect_to search_heroines_path(params[:q])
  end


  def show
    @heroine = Heroine.find(params[:id])
  end

  def new
    @errors = flash[:errors] || {}
    @heroine = Heroine.new(params[:id])
  end

  def create
    @heroine = Heroine.new(heroine_params[:heroine])
    if @heroine.valid?
       @heroine.save
       redirect_to @heroine
    else
      flash[:errors] = @heroine.errors.messages
      render :new
    end
  end

  def edit
    @heroine = Heroine.find(params[:id])    
  end

  def update
    @heroine = Heroine.find(params[:id])
    @heroine = @heroine.assign_attributes(herione_params[:heroine])
    if @heroine.valid?
      @heroine.save
      redirect_to heroines_path
    else
      render :edit
    end
  end

  def destroy
    @heroine = Heroine.find(params[:id])    
    @heroine.destroy
    redirect_to heroines_path
  end

  private
  def heroine_params
    params.permit(heroine:[:name, :super_name, :power_id])
  end
end

class ManufacturersController < ApplicationController

  def new
    @manufacturer = Manufacturer.new
  end

  def create
    @manufacturer = Manufacturer.new(manufacturer_params)
    if @manufacturer.save
      flash[:notice] = "You successfully recorded a manufacturer."
      redirect_to new_manufacturer_path
    else
      flash[:notice] = "Please fill in the required fields."
      render :new
    end
  end

  protected

  def manufacturer_params
    params.require(:manufacturer).permit(:name, :country)
  end

end

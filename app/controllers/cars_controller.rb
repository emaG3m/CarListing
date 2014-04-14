class CarsController < ApplicationController

  def new
    @car = Car.new
  end

  def create
    @car = Car.new(car_params)
    if @car.save
      flash[:notice] = "You successfully recorded a car."
      redirect_to new_car_path
    else
      flash[:notice] = "Please fill in the required fields with the valid information."
      render 'new'
    end
  end

  protected

  def car_params
    params.require(:car).permit(:color, :year, :mileage, :description, :manufacturer_id)
  end
end

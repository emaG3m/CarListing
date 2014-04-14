require 'spec_helper'

feature "User records a newly acquired car", %Q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
} do

  # ---Acceptance Criteria---
  # I must specify the color, year, and mileage of the car.
  # Only years from 1980 and above can be specified.
  # I can optionally specify a description of the car.
  # If I enter all of the required information in the required formats, the car is recorded.
  # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
  # Upon successfully creating a car, I am redirected so that I can create another car.

  scenario "A car is created when user supplies all required information" do
    prev_count = Car.count
    car = FactoryGirl.build(:car)
    visit new_car_path

    fill_in 'Color',      with: car.color
    fill_in 'Year',       with: car.year
    fill_in 'Mileage',    with: car.mileage
    fill_in 'Description',with: car.description
    click_button "Create Car"

    expect(current_path).to eql(new_car_path)
    expect(page).to have_content("You successfully recorded a car")
    expect(Car.count).to eql(prev_count + 1)
  end

  scenario "A car is created with an invalid year" do
    prev_count = Car.count
    car = FactoryGirl.build(:car, year: 1977)
    visit new_car_path

    fill_in 'Color',      with: car.color
    fill_in 'Year',       with: car.year
    fill_in 'Mileage',    with: car.mileage
    fill_in 'Description',with: car.description
    click_button "Create Car"

    expect(page).to have_content("Please fill in the required fields with the valid information.")
    expect(Car.count).to eql(prev_count)
  end

  scenario "A car is not created without the required information" do
    prev_count = Car.count
    visit new_car_path

    click_button "Create Car"
    expect(page).to have_content("Please fill in the required fields with the valid information.")
    expect(page).to have_content("can't be blank")
    expect(Car.count).to eql(prev_count)
  end
end

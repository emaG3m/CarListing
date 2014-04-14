require 'spec_helper'

feature "user can associate a manufacturer with a car", %Q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
} do

# ---Acceptance Criteria---
# When recording a car listing, I want to optionally associate it with its manufacturer.
# If I delete a manufacturer, the manufacturer and its primary key should no longer be associated with any car listings.

  scenario "User optionally assigns a manufacturer to a car" do
    prev_count = Car.count
    car = FactoryGirl.build(:car)
    manufacturer = FactoryGirl.create(:manufacturer)
    visit new_car_path

    fill_in 'Color',      with: car.color
    fill_in 'Year',       with: car.year
    fill_in 'Mileage',    with: car.mileage
    fill_in 'Description',with: car.description
    select manufacturer.name, from: 'Manufacturer'
    click_button "Create Car"

    expect(page).to have_content("You successfully recorded a car")
    expect(Car.count).to eq(prev_count + 1)
    expect(Car.last.manufacturer).to eql(manufacturer)
  end
end

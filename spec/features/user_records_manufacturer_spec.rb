require 'spec_helper'

feature "User records a manufacturer", %Q{
  As a car salesperson
I want to record a car manufacturer
So that I can keep track of the types of cars found in the lot
} do

  # --Acceptance Criteria---
  # I must specify a manufacturer name and country.
  # If I do not specify the required information, I am presented with errors.
  # If I specify the required information, the manufacturer is recorded and I am redirected to enter another new manufacturer.

  scenario "a user creates a manufacturer when they provide the required fields" do
    prev_count = Manufacturer.count
    manufacturer = FactoryGirl.build(:manufacturer)
    visit new_manufacturer_path

    fill_in "Name",     with: manufacturer.name
    fill_in "Country",  with: manufacturer.country
    click_button "Create Manufacturer"

    expect(current_path).to eql(new_manufacturer_path)
    expect(page).to have_content("You successfully recorded a manufacturer.")
    expect(Manufacturer.count).to eql(prev_count + 1)
  end

  scenario "a user does not provide the valid information" do
    prev_count = Manufacturer.count
    visit new_manufacturer_path

    click_button "Create Manufacturer"

    expect(page).to have_content("Please fill in the required fields.")
    expect(Manufacturer.count).to eql(prev_count)
  end


end

require 'spec_helper'

describe Car do
  context "validations" do
    next_year = (Time.now.year) + 1
    it { should validate_presence_of(:color) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:mileage) }
    it { should_not have_valid(:year).when(1979, 1880, next_year) }
    it { should have_valid(:year).when(1980, 2014, 1997, 2000) }
  end
end



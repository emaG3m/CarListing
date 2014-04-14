require 'spec_helper'

describe Manufacturer do
  context "validations" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:country) }
  end

  context "associations" do
    it { should have_many(:cars) }
  end

end

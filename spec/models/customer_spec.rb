require 'rails_helper'

RSpec.describe Customer, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:loyalty_programs) }

    it { should have_many(:purchased_products) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

require 'rails_helper'

RSpec.describe Product, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:merchants) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

require 'rails_helper'

RSpec.describe Merchant, type: :model do
  
    describe "Direct Associations" do

    it { should have_many(:coupons) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

require 'rails_helper'

RSpec.describe PurchasedProduct, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:productsreview) }

    it { should belong_to(:loyaltyprogram) }

    it { should belong_to(:customers) }

    it { should belong_to(:products) }

    it { should belong_to(:coupons) }

    end

    describe "InDirect Associations" do

    it { should have_one(:merchant) }

    end

    describe "Validations" do

    end
end

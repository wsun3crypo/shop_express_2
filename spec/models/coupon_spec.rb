require "rails_helper"

RSpec.describe Coupon, type: :model do
  describe "Direct Associations" do
    it { should have_many(:assigned_coupons) }

    it { should have_many(:purchased_products) }

    it { should belong_to(:merchants) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

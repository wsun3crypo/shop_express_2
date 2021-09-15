require "rails_helper"

RSpec.describe AssignedCoupon, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:customers) }

    it { should belong_to(:coupons) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

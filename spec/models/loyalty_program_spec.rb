require "rails_helper"

RSpec.describe LoyaltyProgram, type: :model do
  describe "Direct Associations" do
    it { should have_many(:purchased_products) }

    it { should belong_to(:customers) }

    it { should belong_to(:merchants) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end

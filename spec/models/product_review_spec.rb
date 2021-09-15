require 'rails_helper'

RSpec.describe ProductReview, type: :model do
  
    describe "Direct Associations" do

    it { should belong_to(:customers) }

    end

    describe "InDirect Associations" do

    end

    describe "Validations" do

    end
end

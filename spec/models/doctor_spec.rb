require 'rails_helper'

describe Doctor, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :specialty }
    it { should validate_presence_of :school }
  end

  describe "relationships" do
    it {should belong_to :hospital}
    it {should have_many(:surgeries).through(:doctor_surgeries)}
  end
end

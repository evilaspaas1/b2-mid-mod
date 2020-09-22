require 'rails_helper'

describe Surgery, type: :model do
  describe "validations" do
    it { should validate_presence_of :title }
    it { should validate_presence_of :day }
    it { should validate_presence_of :operating_room_number }
  end

  describe "relationships" do
    it {should have_many :doctor_surgeries}
    it {should have_many(:doctors).through(:doctor_surgeries)}
  end
end

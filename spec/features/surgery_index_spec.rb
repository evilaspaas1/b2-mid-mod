require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "When I visit a surgery’s index page" do
    it "I see the title of all surgeries" do
      @hospital_1 = Hospital.create(name: "Van's Hospital")
      # @hospital_2 = Hospital.create(name: "OSF")

      @austin = @hospital_1.doctors.create(name: "Austin", specialty: "Heart", school: "Turing")
      @michael = @hospital_1.doctors.create(name: "Michael", specialty: "Heart", school: "Harvard")
      @greg = @hospital_1.doctors.create(name: "Greg", specialty: "Back", school: "UCLA")
      @jared = @hospital_1.doctors.create(name: "Jared", specialty: "Back", school: "USC")

      @heart = Surgery.create(title: "Heart Surgery", day: "Tuesday", operating_room_number: "404")
      @spine = Surgery.create(title: "Spinal Surgery", day: "Thursday", operating_room_number: "505")

      @heart.doctors << @austin
      @heart.doctors << @michael
      @spine.doctors << @greg
      @spine.doctors << @jared

      visit '/surgeries'

      within "#surgery-#{@heart.id}" do
        expect(page).to have_link(@heart.title)
        expect(page).to have_content(@austin.name)
        expect(page).to have_content(@michael.name)
      end

      within "#surgery-#{@spine.id}" do
        expect(page).to have_link(@spine.title)
        expect(page).to have_content(@greg.name)
        expect(page).to have_content(@jared.name)
      end
    end
  end
end

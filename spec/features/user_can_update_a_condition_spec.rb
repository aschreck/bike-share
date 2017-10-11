describe "when a user clicks edit button on an individual condition and changes fields" do
  it "edits the condition in the database" do 
      Condition.create({date: "2013-08-29",
                        min_temperature_f: 10,
                        max_temperature_f: 20,
                        mean_temperature_f: 15,
                        mean_humidity: 50,
                        mean_visibility_miles: 20,
                        mean_wind_speed_mph: 5,
                        precipitation_inches: 0
                        })     
      visit '/conditions/1'
      click_button("edit")
      fill_in "condition[max_temperature_f]", with: 30 
      fill_in "condition[mean_humidity]", with: 60
      click_button("Edit")
      visit '/conditions'

      expect(page).to have_content 30
      expect(page).to have_content 60
  end 
end 
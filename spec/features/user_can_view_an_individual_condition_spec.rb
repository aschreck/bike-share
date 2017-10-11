describe "when a user clicks on a condition from the list" do
  it "displays an individual condition." do
    Condition.create({date: "2013-08-29",
      min_temperature_f: 10,
      max_temperature_f: 20,
      mean_temperature_f: 15,
      mean_humidity: 50,
      mean_visibility_miles: 20,
      mean_wind_speed_mph: 5,
      precipitation_inches: 0
        })

      visit "/conditions/1"
      expect(page).to have_content(50)
  end 
end 
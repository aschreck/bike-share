describe "when a user hits the delete button in an individual condition view" do
  it "deletes the condition from the database" do
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
    click_button("delete")
    expect(Condition.all.count).to eq 0
  end 
end 
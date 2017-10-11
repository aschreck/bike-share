describe "user travels to conditions URI '/conditions'" do
  it "gets you to the conditions index view" do
    visit '/conditions'

    within("h1") do
      expect(page).to have_content("Conditions")
    end
  end
end

describe "user clicks on date of entry" do
  it "gets you to the show page for that entry" do
    Condition.create({date: "2013-08-29",
      min_temperature_f: 10,
      max_temperature_f: 20,
      mean_temperature_f: 15,
      mean_humidity: 50,
      mean_visibility_miles: 20,
      mean_wind_speed_mph: 5,
      precipitation_inches: 0
        })

    Condition.create({date: "2013-08-30",
      min_temperature_f: 12,
      max_temperature_f: 21,
      mean_temperature_f: 16,
      mean_humidity: 51,
      mean_visibility_miles: 19,
      mean_wind_speed_mph: 4,
      precipitation_inches: 0
        })

    visit '/conditions'
    
    expect(page).to have_content(50)
    expect(page).to have_content(51)
  end
end

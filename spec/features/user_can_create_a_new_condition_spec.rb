describe "user fills out new condition form and hits enter" do
  it "creates a new condition." do 
    visit '/conditions/new'

    fill_in "condition[date]", with: Date.strptime('01/29/2014', "%m/%d/%Y")
    fill_in "condition[max_temperature_f]", with: 75
    fill_in "condition[min_temperature_f]", with: 35
    fill_in "condition[mean_temperature_f]", with: 65
    fill_in "condition[mean_humidity]", with: 75.0
    fill_in "condition[mean_visibility_miles]", with: 12.0
    fill_in "condition[mean_wind_speed_mph]", with: 6.0
    fill_in "condition[precipitation_inches]", with: 0.0
    click_button "Create"
    
    expect(Condition.count).to eq(1)
    expect(Condition.first.max_temperature_f).to eq(75)
  end 
end 
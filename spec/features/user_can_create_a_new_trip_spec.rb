describe "When a user visits '/trips/new', enters information, and clicks submit" do
  it "a new trip has been created" do
    visit '/trips/new'
    fill_in "trip[start_date]", with: Date.strptime("8/6/2016", "%m/%d/%Y")
    fill_in "trip[end_date]", with: Date.strptime("8/6/2016", "%m/%d/%Y")
    fill_in "trip[duration]", with: 345
    fill_in "trip[start_station_name]", with: "Union Station"
    fill_in "trip[end_station_name]", with: "Union Station"
    fill_in "trip[bike_id]", with: 35
    fill_in "trip[subscription_type]", with: "Subscriber"
    click_button 'Create'

    expect(Trip.count).to eq(1)
    expect(Trip.first.start_station_name).to eq "Union Station"
  end
end

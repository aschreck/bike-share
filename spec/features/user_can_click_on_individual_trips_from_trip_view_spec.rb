describe "When a user visits '/trips/:id'" do
  it "the user sees the individual trip show page" do
    Trip.create({duration: 2,
                start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                start_station_name: "Union Station",
                start_station_id: "12",
                end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                end_station_name: "Union Station",
                end_station_id: "12",
                bike_id: 215,
                subscription_type: "Subscriber",
                zip_code: 19091
                })
    visit '/trips/1'

    expect(page).to have_content("Duration")
    expect(page).to have_content("Union Station")
    expect(page).to have_content("Subscriber")
  end
end

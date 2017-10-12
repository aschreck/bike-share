describe "When a user visits '/trips/:id/edit', change the information, and click submit" do
  it "the trip information has been updated" do
    Trip.create({duration: 2,
                 start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                 start_station_name: "Union Station",
                 start_station_id: "12",
                 end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                 end_station_name: "Union Station",
                 end_station_id: "3",
                 bike_id: 215,
                 subscription_type: "Subscriber",
                 zip_code: 19091
                })
    visit '/trips/1/edit'

    fill_in 'trip[duration]', with: 50
    click_button 'Edit'

    expect(Trip.first.duration).to eq(50)
  end
end

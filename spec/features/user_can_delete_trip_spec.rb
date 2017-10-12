describe "When a user clicks on the delete button underneath a trip" do
  it "that trip has been deleted" do
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
    visit '/trips/1'
    click_button 'delete'
  end
end

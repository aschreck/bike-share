describe "When a user visits '/trips-dashboard'" do
  it "the user can see the trips dashboard information" do
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
    Trip.create({duration: 98,
                 start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                 start_station_name: "Union Station",
                 start_station_id: "12",
                 end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                 end_station_name: "16th & Larimer",
                 end_station_id: "3",
                 bike_id: 989,
                 subscription_type: "Subscriber",
                 zip_code: 19091
                })
    Station.create({name: "San Jose Diridon Caltrain Station",
                    station_id: "12",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })
    Station.create({name: "Union Station",
                    station_id: "3",
                    dock_count: 31,
                    city: "Denver",
                    installation_date: "10/10/2017"
                    })
    visit '/trips-dashboard'

    expect(page).to have_content("Average Ride")
    expect(page).to have_content(50)
    expect(page).to have_content("Subscriber")
    expect(page).to have_content(Date.strptime("8/6/2016", "%m/%d/%Y"))
  end
end

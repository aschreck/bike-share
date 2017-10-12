describe "When a user visits '/station-dashboard'" do
  it "they see the station dashboard" do
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
    visit '/station-dashboard'

    expect(page).to have_content("Total Station Count")
    expect(page).to have_content(2)
    expect(page).to have_content("Fewest Bikes Available")
    expect(page).to have_content(27)
  end
end

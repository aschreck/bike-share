describe "When a user visits the station index page and clicks delete under one of the stations" do
  it "the station has been deleted" do
    Station.create({name: "San Jose Diridon Caltrain Station",
                    station_id: "10",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })
    visit '/stations'
    click_button 'delete'

    expect(Station.count).to eq(0)
  end
end

describe "When a user visits a station's show page and clicks delete" do
  it "the station has been deleted" do
    Station.create({name: "San Jose Diridon Caltrain Station",
                    station_id: "10",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })
    visit '/stations/1'
    click_button 'delete'

    expect(Station.count).to eq(0)
  end
end

describe "When a user visits a station's show page, clicks edit button, and submits updated information" do
  it "the user changes the station's information" do
    Station.create({name: "San Jose Diridon Caltrain Station",
                    station_id: "10",
                    dock_count: 27,
                    city: "San Jose",
                    installation_date: "8/6/2013"
                    })

    visit '/stations/1'
    click_button 'edit'
    fill_in "station[name]", with: 'Union Station'
    click_button 'submit'

    expect(Station.first.name).to eq("Union Station")
  end
end

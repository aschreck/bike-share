describe "When a user travels to '/trips'" do
  it 'takes you to trips index view' do 
    visit '/trips'

    within('h1') do
      expect(page).to have_content("Trips")
    end 
  end 
end 

describe "user clicks on trip icon" do 
  it "takes you to the individual view for that entry" do 
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
    visit '/trips'
    click_link(href: '/trips/1')
    expect(page).to have_content(2)
  end 
end 
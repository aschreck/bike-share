describe "When a user visits '/stations/new', enters station info, and clicks submit" do
  it "a new station is created" do
    visit '/stations/new'

    fill_in "station[name]", with: 'Union Station'
    fill_in "station[dock_count]", with: 35
    fill_in "station[city]", with: "Denver"
    fill_in "station[installation_date]", with: Date.strptime("8/6/2016", "%m/%d/%Y")
    click_button 'Create'

    expect(Station.count).to eq(1)
    expect(Station.first.dock_count).to eq(35)
  end
end

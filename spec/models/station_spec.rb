describe Station do

  describe "Validations" do
    it "is invalid without all attributes" do
      s1=Station.create(dock_count: 4, city: "Denver", installation_date: "Monday")
      s2=Station.create(name:"Union Station", city: "Denver", installation_date: "Monday")
      s3=Station.create(name:"Union Station", dock_count: 4, installation_date: "Monday")
      s4=Station.create(name:"Union Station", dock_count: 4, city: "Denver")

      expect(s1).to_not be_valid
      expect(s2).to_not be_valid
      expect(s3).to_not be_valid
      expect(s4).to_not be_valid
    end
  end

  describe "Class Methods" do
    describe ".average_available_bikes" do
      it "returns the average dock count" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.average_available_bikes).to eq(29)
      end
    end

    describe ".maximum_by_bikes" do
      it "returns the max dock count" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.maximum_by_bikes).to eq(31)
      end
    end

    describe ".stations_with_max_bikes" do
      it "returns array of station(s) with most bikes" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.stations_with_max_bikes).to eq(["Union Station"])
      end
    end

    describe ".minimum_by_bikes" do
      it "returns the min dock count" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.minimum_by_bikes).to eq(27)
      end
    end

    describe ".stations_with_min_bikes" do
      it "returns array of station(s) with least bikes" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.stations_with_min_bikes).to eq(["San Jose Diridon Caltrain Station"])
      end
    end

    describe ".most_recently_installed" do
      it "returns an array of the station name(s) with the most recent installation date" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.most_recently_installed).to eq(["Union Station"])
      end
    end

    describe ".earliest_installed" do
      it "returns an array of the station name(s) with the earliest intallation date" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "10",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "21",
                        dock_count: 31,
                        city: "Denver",
                        installation_date: "10/10/2017"
                        })

        expect(Station.earliest_installed).to eq(["San Jose Diridon Caltrain Station"])
      end
    end
    
  end
end

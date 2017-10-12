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

  describe "Instance Methods" do
    describe '#start_ride_count' do
      it "returns the station's number of trips started there" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.start_ride_count).to eq(1)
      end
    end

    describe '#end_ride_count' do
      it "returns the station's number of trips ending there" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.end_ride_count).to eq(1)
      end
    end

    describe '#most_frequent_destination' do
      it "for trips starting at this station, returns the name of the station that's the most frequent destination" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.most_frequent_destination).to eq("Union Station")
      end
    end

    describe '#most_frequent_destination' do
      it "for trips ending at this station, returns the name of the station that's the most frequent origin" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     start_station_id: "3",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: "16th & Larimer",
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.most_frequent_origin).to eq("Union Station")
      end
    end

    describe '#most_popular_date' do
      it "returns the most popular trip date for station" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.most_popular_date).to eq(Date.strptime("8/6/2016", "%m/%d/%Y").strftime("%B %d, %Y"))
      end
    end

    describe '#most_popular_zip' do
      it "returns the most popular zipcode from among this station's trips" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.most_popular_zip).to eq(19091)
      end
    end

    describe '#most_frequent_bike_id' do
      it "returns the bike_id that's been used most for trips at this station" do
        Station.create({name: "San Jose Diridon Caltrain Station",
                        station_id: "1",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Station.create({name: "Union Station",
                        station_id: "3",
                        dock_count: 27,
                        city: "San Jose",
                        installation_date: "8/6/2013"
                        })
        Trip.create({duration: 2,
                     start_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     start_station_name: "Union Station",
                     start_station_id: "1",
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
                     end_station_id: "1",
                     bike_id: 989,
                     subscription_type: "Subscriber",
                     zip_code: 19091
                    })
        station = Station.first

        expect(station.most_frequent_bike_id).to eq(215)
      end
    end
  end
end

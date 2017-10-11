describe Condition do
  describe "Validations" do
    it "is invalid without all attributes" do
      c1 = Condition.create(max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
      c2 = Condition.create(date: "2013-08-29", mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
      c3 = Condition.create(date: "2013-08-29", max_temperature_f: 74.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
      c4 = Condition.create(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
      c5 = Condition.create(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
      c6 = Condition.create(date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
      
      expect(c1).to_not be_valid
      expect(c2).to be_valid
      expect(c3).to_not be_valid
      expect(c4).to_not be_valid
      expect(c5).to_not be_valid
      expect(c6).to_not be_valid
    end 
  end 

  describe "Model Methods" do
    describe ".temp_breakout" do 
      it "returns a hash of " do 
        Condition.create(id: 3666, date: "2013-08-29", max_temperature_f: 74.0, mean_temperature_f: 68.0, min_temperature_f: 61.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 11.0, precipitation_inches: 0.0, zip_code: "94107")
        #has 748 trips
        Condition.create(id: 3667, date: "2013-08-30", max_temperature_f: 78.0, mean_temperature_f: 69.0, min_temperature_f: 60.0, mean_humidity: 70.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 13.0, precipitation_inches: 0.0, zip_code: "94107")        
        #has 714 trips  
				Condition.create(id: 3668, date: "2013-08-31", max_temperature_f: 71.0, mean_temperature_f: 64.0, min_temperature_f: 57.0, mean_humidity: 75.0, mean_visibility_miles: 10.0, mean_wind_speed_mph: 15.0, precipitation_inches: 0.0, zip_code: "94107")
				#has 640 trips
        
        Trip.create({duration: 3,
                     start_date: Date.strptime('8/29/2013', '%m/%d/%Y'),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: 'Union Station',
                     end_station_id: '3',
                     bike_id: 215,
                     subscription_type: 'Customer',
                     zip_code: 19091
                    })

				Trip.create({duration: 2,
                     start_date: Date.strptime('8/29/2013', '%m/%d/%Y'),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: 'Union Station',
                     end_station_id: '3',
                     bike_id: 215,
                     subscription_type: 'Customer',
                     zip_code: 19091
                    })
        Trip.create({duration: 5,
                     start_date: Date.strptime('8/29/2013', '%m/%d/%Y'),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: 'Union Station',
                     end_station_id: '3',
                     bike_id: 215,
                     subscription_type: 'Customer',
                     zip_code: 19091
          })
        
          Trip.create({duration: 6,
                     start_date: Date.strptime('8/30/2013', '%m/%d/%Y'),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: 'Union Station',
                     end_station_id: '3',
                     bike_id: 215,
                     subscription_type: 'Customer',
                     zip_code: 19091
                    })  
       
          Trip.create({duration: 7,
                     start_date: Date.strptime('8/30/2013', '%m/%d/%Y'),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: 'Union Station',
                     end_station_id: '3',
                     bike_id: 215,
                     subscription_type: 'Customer',
                     zip_code: 19091
                    })
          
          Trip.create({duration: 8,
                     start_date: Date.strptime('8/31/2013', '%m/%d/%Y'),
                     start_station_name: "Union Station",
                     start_station_id: "12",
                     end_date: Date.strptime("8/6/2016", "%m/%d/%Y"),
                     end_station_name: 'Union Station',
                     end_station_id: '3',
                     bike_id: 215,
                     subscription_type: 'Customer',
                     zip_code: 19091
                    })

      data =	Condition.temp_breakout(70)
      require 'pry'; binding.pry
      
			expect(data[:avg]).to eq 2
			expect(data[:max]).to eq 3
			expect(data[:min]).to eq 1
      end
    end
  end  
end 

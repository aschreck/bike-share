require 'will_paginate'
require 'will_paginate/active_record'

class Trip <ActiveRecord::Base
  validates :id, uniqueness: true

  validates_presence_of :duration,
                        :start_date,
                        :start_station_name,
                        :end_date,
                        :end_station_name,
                        :bike_id,
                        :subscription_type
	self.per_page = 30
	belongs_to :condition, class_name: "Condition", foreign_key: "condition_id"

	def self.avg_duration
    time = average(:duration)
    Time.at(time).utc.strftime("%H:%M:%S")
  end

  def self.longest_ride
    time = maximum(:duration)
    Time.at(time).utc.strftime("%H:%M:%S")
  end

  def self.shortest_ride
    time = minimum(:duration)
    Time.at(time).utc.strftime("%H:%M:%S")
  end

  def self.most_departures
    trip = group(:start_station_id).order("count_all DESC").limit(1).count
    Station.find_by(station_id: trip.keys.first).name
  end

  def self.most_arrivals
    trip = group(:end_station_id).order("count_all DESC").limit(1).count
    Station.find_by(station_id: trip.keys.first).name
  end

  def self.month_year_breakdown
    month_break = group("DATE_TRUNC('month', start_date)").count.to_a
    sorted = month_break.sort_by { |i| i[0]}
    sorted.map do |i|
      [i.first.strftime("%B %Y"), i.last]
    end
  end

  def self.year_breakdown
    year_breakdown = group("DATE_TRUNC('year', start_date)").count.to_a
    sorted = year_breakdown.sort_by { |i| i[0]}
    sorted.map do |i|
      [i.first.strftime("%Y"), i.last]
    end
  end

  def self.most_ridden_bike
    bike_data = bikes_and_uses
    bike_data.max_by do |id_and_count|
      id_and_count.last
    end.first
  end

  def self.least_ridden_bike
    bike_data = bikes_and_uses
    bike_data.min_by do |id_and_count|
      id_and_count.last
    end.first
  end

  def self.bikes_and_uses
    group(:bike_id).count
  end

	def self.ride_count(bike_id)
		bikes_and_uses[bike_id]
	end

  def self.subscription_types_counts
    group(:subscription_type).count
  end

  def self.subscription_types_and_info
		subscription_data = {}
    subscription_types_counts.each do |type, count|
      pct_info = ((count.to_f/all.count) * 100).truncate
      subscription_data[type] = { count: count, pct: pct_info }
    end
		subscription_data
  end

  def self.busiest_day
    day_data = days_and_trips
    day_data.max_by do |day_and_count|
      day_and_count.last
    end.first
  end

  def self.slowest_day
    day_data = days_and_trips
    day_data.min_by do |day_and_count|
      day_and_count.last
    end.first
  end

  def self.days_and_trips
    group(:start_date).count
  end

end

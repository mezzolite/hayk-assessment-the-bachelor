require "pry"

def get_first_name_of_season_winner(data, season)
  data[season].each do |contestant|
    if contestant["status"] == "Winner"
     return contestant["name"].split[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["occupation"] == occupation
        return contestant["name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  hometown_girls = []
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        hometown_girls << contestant["name"]
      end
    end
  end
  return hometown_girls.count
end

def get_occupation(data, hometown)
  hometown_jobs = []
  data.each do |season, contestants|
    contestants.each do |contestant|
      if contestant["hometown"] == hometown
        hometown_jobs << contestant["occupation"]
      end
    end
  end
  return hometown_jobs[0]
end

def get_average_age_for_season(data, season)
  age_array = []
  average_age = 0
  data[season].each do |contestant|
    age_array << contestant["age"].to_f
  end
  average_age = age_array.reduce(:+)/age_array.length
  return average_age.round
end

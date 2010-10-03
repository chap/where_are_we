require 'fastercsv'

FasterCSV.foreach("#{Rails.root}/db/seed/unemployment_international.csv", {:headers => :first_row}) do |row|
  c = Country.find_or_create_by_name(row[0])
  c.create_unemployment_stat(:year => row[1], :coverage => row[2], :source => row[3], :unemployment_type => row[4], :unemployment_rate => row[5])
end

FasterCSV.foreach("#{Rails.root}/db/seed/unemployment_usa.csv", {:headers => :first_row}) do |row|
  c = UsCounty.find_or_create_by_name(row[0].split(",")[0], :state => row[0].split(",")[1])
  c.create_unemployment_stat(:year => row[1], :total_workforce => row[2].gsub(',', ''), :total_employed => row[3].gsub(',', ''), :total_unemployed => row[4].gsub(',', ''), :unemployment_rate => row[5])
end
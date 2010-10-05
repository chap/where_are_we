class Visit < ActiveRecord::Base
  belongs_to :us_county
  belongs_to :match_country, :class_name => 'Country'
  before_validation :address_lookup, :associate_us_county, :match
  
  def city_state
    #"#{self.city}, #{self.state} (#{self.zip})"
    "#{self.city}, #{self.state}"
  end
  
  def match_country_name
    match_country.name
  end
  
  def match_country_stat
    match_country.unemployment_rate
  end
  
  def unemployment_rate
    us_county.unemployment_stat.unemployment_rate
  end

  def match
    countries = []
    span = 0.3
    while countries.empty? do 
      countries = Country.joins(:unemployment_stat).
        where('unemployment_rate >= ?', unemployment_rate - span).
        where('unemployment_rate <= ?', unemployment_rate + span)
      span += 0.3
    end

    country = countries[rand(countries.length)]
    if country
      self.match_country = country
    else
      false
    end
  end

  private
  def address_lookup
    a = Geokit::Geocoders::GoogleGeocoder.reverse_geocode("#{self.lat},#{self.lng}")
    if a
      self.geocode_success = true
      self.zip = a.zip
      self.city = a.city
      self.state = a.state
      self.province = a.province
      self.street_address = a.street_address
      self.country = a.country
    else
      geocode_success = false
      false
    end
  end
  
  def associate_us_county
    u = UsCounty.find_closest(:origin => [lat, lng])
    unless u.nil?
      self.us_county = u
    else
      false
    end
  end
end

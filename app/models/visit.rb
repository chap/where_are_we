class Visit < ActiveRecord::Base
  belongs_to :us_county
  belongs_to :match_country, :class_name => 'Country'
  after_create :address_lookup, :associate_us_county
  
  def city_state
    #"#{self.city}, #{self.state} (#{self.zip})"
    "#{self.city}, #{self.state}"
  end
  
  def unemployment_rate
    us_county.unemployment_stat.unemployment_rate
  end

  def match_country
    countries = []
    span = 0.3
    while countries.empty? do 
      countries = Country.joins(:unemployment_stat).
        where('unemployment_rate >= ?', self.us_county.unemployment_stat.unemployment_rate - span).
        where('unemployment_rate <= ?', self.us_county.unemployment_stat.unemployment_rate + span)
      span += 0.3
    end

    country = countries[rand(countries.length)]
    if country
      self.update_attributes(:match_country => country)
      country
    else
      false
    end
  end

  private
  def address_lookup
    if self.positioning_success?
      a = Geokit::Geocoders::GoogleGeocoder.reverse_geocode("#{self.lat},#{self.lng}")
      if a
        self.update_attributes(:geocode_success => true,
                               :zip => a.zip,
                               :city => a.city,
                               :state => a.state,
                               :province => a.province,
                               :street_address => a.street_address,
                               :country => a.country)
      else
        self.update_attribute(:geocode_success, false)
        false
      end
    end
  end
  
  def associate_us_county
    u = UsCounty.find_closest(:origin => [lat, lng])
    unless u.nil?
      update_attributes(:us_county => u)
      u
    else
      false
    end
  end
end

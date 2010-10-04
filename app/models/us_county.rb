class UsCounty < ActiveRecord::Base
  has_one :unemployment_stat, :as => :unemployable
  has_many :visits
  
  acts_as_mappable
  
  def unemployment_rate
    unemployment_stat.unemployment_rate
  end
  
  def geocode
    loc = Geokit::Geocoders::MultiGeocoder.geocode("#{name}#{',' unless state.blank?} #{state}")
    if loc.success
      self.update_attributes(:lat => loc.lat, :lng => loc.lng)
    end
  end
end

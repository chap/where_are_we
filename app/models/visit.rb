class Visit < ActiveRecord::Base
  after_create :address_lookup

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
end

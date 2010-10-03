if Rails.env.production?
  # key for where-are-we.heroku.com
  Geokit::Geocoders::google = 'ABQIAAAALpnSm3JOwc5IzlAclvi8aRSpm_IY_76VKxLJQ-MpAdS75LGYbxTT1-tHrgnXucACRZV65RFTBIk80A'
else
  # key for where-are-we.local
  Geokit::Geocoders::google = 'ABQIAAAALpnSm3JOwc5IzlAclvi8aRTudxCDA4p-gftOCz8noeN6ivJUCRRePsHfcqEWf3N-2kJsw-xXzupqYQ'
end
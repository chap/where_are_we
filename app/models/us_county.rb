class UsCounty < ActiveRecord::Base
  has_one :unemployment_stat, :as => :unemployable
  has_many :visits
  
  def unemployment_rate
    unemployment_stat.unemployment_rate
  end
end

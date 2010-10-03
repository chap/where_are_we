class Country < ActiveRecord::Base
  has_one :unemployment_stat, :as => :unemployable
  
  def unemployment_rate
    unemployment_stat.unemployment_rate
  end
end

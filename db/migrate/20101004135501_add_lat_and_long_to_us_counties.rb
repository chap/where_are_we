class AddLatAndLongToUsCounties < ActiveRecord::Migration
  def self.up
    add_column :us_counties, :lat, :float
    add_column :us_counties, :lng, :float
    add_column :us_counties, :distance, :float
  end

  def self.down
    remove_column :us_counties, :lng
    remove_column :us_counties, :lat
    remove_column :us_counties, :distance
  end
end

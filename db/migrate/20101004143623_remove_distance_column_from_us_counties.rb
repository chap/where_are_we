class RemoveDistanceColumnFromUsCounties < ActiveRecord::Migration
  def self.up
    remove_column :us_counties, :distance
  end

  def self.down
    add_column :us_counties, :distance, :float
  end
end

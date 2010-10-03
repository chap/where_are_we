class CreateUsCounties < ActiveRecord::Migration
  def self.up
    create_table :us_counties do |t|
      t.string :name
      t.string :state
      t.timestamps
    end
  end

  def self.down
    drop_table :us_counties
  end
end

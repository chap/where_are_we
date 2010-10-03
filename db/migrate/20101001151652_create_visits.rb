class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.string :ip
      t.float :lat
      t.float :lng
      t.boolean :positioning_success, :default => false, :null => false
      t.boolean :geocode_success, :default => false, :null => false
      t.integer :zip
      t.string :city
      t.string :state
      t.string :province
      t.string :street_address
      t.string :country
      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end

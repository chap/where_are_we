class CreateVisits < ActiveRecord::Migration
  def self.up
    create_table :visits do |t|
      t.string :ip
      t.float :lat
      t.float :lng

      t.timestamps
    end
  end

  def self.down
    drop_table :visits
  end
end

class CreateUnemploymentStats < ActiveRecord::Migration
  def self.up
    create_table :unemployment_stats do |t|
      t.references :unemployable, :polymorphic => true
      t.integer :year
      t.string :coverage
      t.string :source
      t.string :unemployment_type
      t.float :unemployment_rate
      t.integer :total_workforce
      t.integer :total_employed
      t.integer :total_unemployed
      t.timestamps
    end
  end

  def self.down
    drop_table :unemployments
  end
end

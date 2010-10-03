class UnemploymentStat < ActiveRecord::Base
  belongs_to :unemployable, :polymorphic => true
end

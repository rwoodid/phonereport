class Phonecall < ActiveRecord::Base
  belongs_to :period
  belongs_to :cli
  
def total_cost
  each.inject {|total_cost, phonecall| total_cost += phoncall.cost}
end

end


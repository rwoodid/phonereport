class CostCentre < ActiveRecord::Base
  validates_uniqueness_of :name
  has_many :clis

  def total_cost
   totalcost = 0

   clis.each do |cli|        
     cli.phonecalls.each do |phonecall|
       totalcost += phonecall.cost
     end
   end

   sprintf"%.2f",totalcost
  end
  
  def total_cost_for_period(month)
   totalcost = 0

   clis.each do |cli|        
     cli.phonecalls.find(:all, :conditions=> {:period_id => month}).each do |phonecall|
       totalcost += phonecall.cost
     end
   end

   sprintf"%.2f",totalcost
  end
end

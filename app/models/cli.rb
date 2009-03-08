class Cli < ActiveRecord::Base
  belongs_to :cost_center
  has_many :phonecalls
end

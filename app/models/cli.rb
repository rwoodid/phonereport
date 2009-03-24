class Cli < ActiveRecord::Base
  belongs_to :cost_centre
  has_many :phonecalls
end

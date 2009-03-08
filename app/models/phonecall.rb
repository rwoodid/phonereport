class Phonecall < ActiveRecord::Base
  belongs_to :period
  belongs_to :cli
end

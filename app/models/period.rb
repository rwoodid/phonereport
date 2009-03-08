class Period < ActiveRecord::Base
  belongs_to :phonecall
  belongs_to :reort
end

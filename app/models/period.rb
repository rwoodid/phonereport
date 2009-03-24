class Period < ActiveRecord::Base
  has_many :phonecalls
  belongs_to :report
end

class CostCentreUpload < ActiveRecord::Base
  require 'fastercsv'
  require 'bigdecimal'
  
  has_attached_file :cost_centre_file,
                    :url  => "/assets/cost_centre_uploads/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/cost_centre_uploads/:id/:style/:basename.:extension"

  validates_attachment_presence :cost_centre_file
  validates_attachment_size :cost_centre_file, :less_than => 5.megabytes
  #validates_attachment_content_type :csv_file, :content_type => ['image/jpeg', 'image/png']
  
  after_save :load_the_cost_centres_from_csv
  
  def filepath
    firstpath = "/Users/richardwood/RailsWork/phonereport/public/assets/cost_centre_uploads/"
    secondpath = self.id.to_s
    thirdpath = "/original/"
    fourthpath = self.cost_centre_file_file_name
    firstpath + secondpath + thirdpath + fourthpath
  end
    
  
  def load_the_cost_centres_from_csv
    
    FasterCSV.foreach("#{filepath}", :headers => true) do |row|
      centre_number = row["Number"].gsub(/\'/, '')
      centre = row["CostCentre"]
      @cost_centre = CostCentre.find_or_create_by_name("#{centre}") 
      @cli = Cli.find_or_create_by_phone_number("#{centre_number}")
      @cli.cost_centre = @cost_centre
      @cli.save
      
      
    end
      
  end
  
end

class Bill < ActiveRecord::Base
  belongs_to :report
  
  has_attached_file :csv_file,
                    :url  => "/assets/bills/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/bills/:id/:style/:basename.:extension"

  validates_attachment_presence :csv_file
  validates_attachment_size :csv_file, :less_than => 5.megabytes
  #validates_attachment_content_type :csv_file, :content_type => ['image/jpeg', 'image/png']
end

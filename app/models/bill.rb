class Bill < ActiveRecord::Base
  require 'fastercsv'
  require 'bigdecimal'
  belongs_to :report
  
  has_attached_file :csv_file,
                    :url  => "/assets/bills/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/bills/:id/:style/:basename.:extension"

  validates_attachment_presence :csv_file
  validates_attachment_size :csv_file, :less_than => 5.megabytes
  #validates_attachment_content_type :csv_file, :content_type => ['image/jpeg', 'image/png']
  after_save :load_phonecalls_from_csv
  
  def filepath
    firstpath = "/Users/richardwood/RailsWork/phonereport/public/assets/bills/"
    secondpath = self.id.to_s
    thirdpath = "/original/"
    fourthpath = self.csv_file_file_name
    firstpath + secondpath + thirdpath + fourthpath
  end
    
  
  def load_phonecalls_from_csv
    
    FasterCSV.foreach("#{filepath}", :headers => true) do |row|
        period = row["Period"]
        @previous_bill_periods = Period.find(:all)
            for previous_bill_period in @previous_bill_periods
              if previous_bill_period.month = period
                flash[:notice] = 'This bill has been previousley loaded.'
                redirect_to new_bill_path
              end
            end
        end
    
    FasterCSV.foreach("#{filepath}", :headers => true) do |row|
      period = row["Period"]
      account = row["AccountNumber"]
      dialfrom = row[" DialledFrom"]
      date_of = row[" Date"]
      call_time = row[" Time"]
      dialto = row[" DialNumber"]
      destination = row["Destination"]
      duration = row["Duration(mins)"]
      cost = row["Cost"]
      call_type = row["CallType"]
      @phonecall = Phonecall.new
      @period = Period.find_or_create_by_month(period)
      @cli = Cli.find_or_create_by_phone_number(dialfrom)
      @phonecall.date_of_call = date_of
      @phonecall.dial_number = dialto
      @phonecall.destination = destination
      @phonecall.period = @period
      @phonecall.cli = @cli
      @phonecall.time = call_time
      @phonecall.duration = duration
      @phonecall.cost = cost
      @phonecall.call_type = call_type
      @phonecall.save
      
    end
      
  end






end

class Accession < ActiveRecord::Base

  set_primary_key 'accessionId'
  set_table_name 'Accessions'
  
  has_many :locations, :through => :accession_location, :foreign_key => "accessionId"
  has_many :accession_location, :foreign_key => "accessionId"
  
  def agreements
    sql = get_query  
    connection.execute(sql)
  end
  
  def get_query
    sql =   "SELECT DISTINCT title as 'Title', acquisitionType as 'Acquisition Type', resourceType as 'Resource Type', "
    sql <<   "agreementSentDate as 'Date Sent', "
    sql <<   "CASE agreementSent "
    sql <<   "  WHEN 1 THEN 'Yes' "
    sql <<   "  WHEN 0 THEN 'No' " 
    sql <<   "  ELSE 'No' "
    sql <<   "END AS 'Sent', "
    sql <<   "agreementReceived as 'Agreement Received', agreementReceivedDate as 'Date Received' "
    sql <<   "FROM Accessions "
    sql <<   "WHERE agreementReceived is NULL "
    sql <<   "AND acquisitionType != 'Unknown' "
    sql <<   "AND resourceType != 'Gift of' "
    sql <<   "ORDER BY title"
  end
  

end

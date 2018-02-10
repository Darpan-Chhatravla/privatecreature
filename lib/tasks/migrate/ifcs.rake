require 'roo'
require 'csv'
namespace :migrate do
  desc 'Migrate ifsc code to database'
  task ifsc_xlsx: :environment do
  	files = Dir.entries("ifsc_codes/")
  	error = []
  	count = 0
  	files.each do |file|
  		next if file == '.' || file == '..'
  		puts count
  		begin
		    xlsx = Roo::Excelx.new("ifsc_codes/#{file}")
				xlsx.each_row_streaming(offset: 1) do |row|
				  IfscCode.create(
				  	bank: 				row[0].cell_value,
				  	ifsc_number:  row[1].cell_value,
				  	micr: 				row[2].cell_value,
				  	branch: 			row[3].cell_value,
				  	address: 			row[4].cell_value,
				  	contact: 			row[5].cell_value,
				  	city: 				row[6].cell_value,
				  	district: 		row[7].cell_value,
				  	state: 				row[8].cell_value
				  )
				end
  		rescue Exception => e
  			error << file
  		end
  		count += 1
  	end
  	puts error
  end
end
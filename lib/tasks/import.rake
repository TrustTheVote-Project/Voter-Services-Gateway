#lib/tasks/import.rake
require 'csv'
namespace :setup do
	desc "Imports a CSV file into an Elector table"
	task :elector_import, [:filename] => :environment do |t,args|
	  csv_text = File.read(args[:filename])
	  csv = CSV.parse(csv_text, :headers => true, :header_converters => :symbol)
	  csv.each do |row|
		puts row.to_hash
		Elector.create!(row.to_hash)
	  end
	end
end

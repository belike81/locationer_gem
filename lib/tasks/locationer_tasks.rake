require "csv"

namespace :locationer do
  desc 'Import cities geo data for locationer API'
  task :import => :environment do
    csv_import_file = Rails.root.join('db/data/domain/US.csv')
    CSV.foreach(csv_import_file) do |row|
      Locationer::GeoData.create! city_name: row[0], latitude: row[1], longitude: row[2], state: row[3]
    end
    puts 'Import completed'
  end
end

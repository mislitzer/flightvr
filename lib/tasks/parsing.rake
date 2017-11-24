require 'csv'

namespace :flightstats do
    desc "Parsing all flightstats"
    task parse_fs: [:environment] do
        path = File.join Rails.root, 'public', 'chart_crosstab.csv'
        csv_fs = open(path)
        csv = CSV.parse(csv_fs, :headers => true)
        csv.each do |row|
            Flightstat.create!(row.to_hash.slice(*%w[Month Value]))
        end
        puts "#{Time.now}-Success!"
    end
end
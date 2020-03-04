namespace :extract do

  desc "Extract and fetched data"
  task data_by_csv_or_json: :environment do
    begin
      response = Etl.call(ARGV[1])
      Unit.save_data(response.formatted_data) if response.success
    rescue Exception => e
      puts "Error in file.."
    end
  end
end

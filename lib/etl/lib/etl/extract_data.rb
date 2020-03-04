require 'light-service'
require 'csv'

module Etl
  class ExtractData
    extend ::LightService::Action

    expects :file
    promises :extracted_data

    executed do |context|
      context.extracted_data = parse_fetched_data(context.file)
    end

    private
      def self.parse_fetched_data(file)
        if file.include? 'csv'
          parse_csv(file)
        else
          parse_json(file)
        end
      end

      def self.parse_csv(file)
        parsed_csv_data = []
        CSV.foreach(file, headers: true, encoding:'iso-8859-1:utf-8') do |row|
          parsed_csv_data << row.to_h
        end
        parsed_csv_data
      end

      def self.parse_json(file)
        parsed_data = JSON.parse(File.read(file))
        if parsed_data["unit_groups"] && parsed_data["unit_groups"].length > 0
          parsed_data["unit_groups"]
        else
          parsed_data["units"]
        end
      end
  end
end

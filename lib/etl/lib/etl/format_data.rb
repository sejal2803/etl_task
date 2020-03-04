require 'light-service'
require 'csv'

module Etl
  class FormatData
    extend ::LightService::Action

    expects :extracted_data
    promises :formatted_data

    executed do |context|
      context.formatted_data = format_extracted_data(context.extracted_data)
    end

    private
      def self.format_extracted_data(extracted_data)
        formatted_data = []
        extracted_data.each do |data|
          formatted_data << required_data_params(data)
        end
        formatted_data
      end

      def self.required_data_params(data)
        {
          name: data["name"],
          description: data["description"],
          price: data["price"].to_d,
          area: data["area"].to_f,
          uom: unit_type(data["unit_type"])
        }
      end

      def self.unit_type data
        return data["name"] if data.is_a? Hash
        data
      end
  end
end

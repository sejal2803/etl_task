require 'light-service'
require "etl/version"
require "etl/extract_data"
require "etl/format_data"

module Etl
  extend ::LightService::Organizer

  def self.call(file)
    with(file: file).reduce(
      Etl::ExtractData,
      Etl::FormatData
    )
  end
end

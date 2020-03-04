class Unit < ApplicationRecord

  default_scope { order(name: :asc)}

  def self.save_data data
    create data
  end
end

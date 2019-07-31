# frozen_string_literal: true

module KepplerProducts
  # Cotization Model
  class Cotization < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid
    belongs_to :product, class_name: 'KepplerProducts::Product'

    def self.index_attributes
      %i[name email phone product_id]
    end
  end
end

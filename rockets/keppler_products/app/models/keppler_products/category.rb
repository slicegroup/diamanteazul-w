# frozen_string_literal: true

module KepplerProducts
  # Category Model
  class Category < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid
    has_ancestry
    validates :name, presence: true

    scope :set_parents, -> { where(ancestry: nil) }

    def self.index_attributes
      %i[name]
    end
  end
end

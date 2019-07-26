# frozen_string_literal: true

module KepplerBanners
  # Banner Model
  class Banner < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    acts_as_list
    acts_as_paranoid
    validates_presence_of :title, :subtitle
    validate :check_cta, on: [:create, :edit]

    def self.index_attributes
      %i[title subtitle link]
    end

    def check_cta
      if cta && link.eql?('')
        errors.add :link, 'Debe introducir un link al CTA'
      end
    end
  end
end

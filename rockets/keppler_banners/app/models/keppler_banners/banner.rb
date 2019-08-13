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
    mount_uploader :image, AttachmentUploader
    acts_as_list
    acts_as_paranoid
    validates_presence_of :image
    validate :check_cta, on: [:create, :edit]

    def self.index_attributes
      %i[title subtitle link]
    end

    def check_cta
      if cta && link.eql?('')
        errors.add :link, 'Debe introducir un link al CTA'
      elsif cta && cta_text.eql?('')
        errors.add :cta_text, 'Debe introducir un texto al CTA'
      end
    end
  end
end

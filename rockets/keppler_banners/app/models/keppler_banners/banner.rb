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
    validate :check_cta, on: [:create, :update]
    validate :check_dimension, on: [:create, :update]

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

    def check_dimension
      return if image_cache.nil?
      if (image.width < 1920) || ( image.height < 480)
        errors.add :image, "La imágen debe tener una dimensión mínima de: 1920x480".html_safe
      end
    end
  end
end

# frozen_string_literal: true

module KepplerProducts
  # Product Model
  class Product < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploaders :images, AttachmentUploader
    acts_as_list
    acts_as_paranoid
    validates_presence_of :name, :category_id, :description, :images
    belongs_to :category, class_name: 'KepplerProducts::Category'
    has_many :cotizations, class_name: 'KepplerProducts::Cotization'

    def self.index_attributes
      %i[name category_id tags]
    end
  end
end

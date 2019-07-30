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

    def self.index_attributes
      %i[name category_id tags]
    end
  end
end

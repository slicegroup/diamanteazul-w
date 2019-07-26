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
    mount_uploader :image, AttachmentUploader
    mount_uploader :banner, AttachmentUploader
    validates_presence_of :name, :image
    validate :unique_category, on: [:create, :edit]

    scope :set_parents, -> { where(ancestry: nil) }

    def self.index_attributes
      %i[name]
    end

    def unique_category
      return if !Category.find_by(name: name, ancestry: nil)
      errors.add :name, 'Ya existe una categoría con ese nombre'
    end
  end
end

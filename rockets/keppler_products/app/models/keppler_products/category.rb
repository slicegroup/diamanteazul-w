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
    has_many :products, class_name: 'KepplerProducts::Product'
    validate :check_dimensions_banner, :on => [:create, :update]
    validate :check_dimensions_image, :on => [:create, :update]

    scope :set_parents, -> { where(ancestry: nil) }
    scope :filter_by_parent, -> (id) { find(id).children }

    def self.index_attributes
      %i[name]
    end

    def unique_category
      return if !Category.find_by(name: name, ancestry: nil)
      errors.add :name, 'Ya existe una categoría con ese nombre'
    end

    def check_dimensions_banner
    	return if banner_cache.nil?
    	if banner.width < banner.height
    		errors.add :banner, 'El banner de publicidad debe tener mayor anchura que altura'
    	elsif banner.width < 600 || banner.height < 300
    		errors.add :banner, 'El banner de publicidad no cumple con las dimensiones mínimas recomendadas: 600x300'
    	end
    end

    def check_dimensions_image
    	return if image_cache.nil?
    	if image.width < 400 || image.height < 300
    		errors.add :image, 'La imágen no cumple con las dimensiones mínimas recomendadas: 400x300'
    	end
    end
  end
end

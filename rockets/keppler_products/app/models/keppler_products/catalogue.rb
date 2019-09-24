# frozen_string_literal: true

module KepplerProducts
  # Catalogue Model
  class Catalogue < ApplicationRecord
    include ActivityHistory
    include CloneRecord
    include Uploadable
    include Downloadable
    include Sortable
    include Searchable
    mount_uploader :banner, AttachmentUploader
    acts_as_list
    acts_as_paranoid
    validate :check_dimensions_banner, :on => [:create, :update]

    def self.index_attributes
      %i[banner]
    end

     def check_dimensions_banner
      return if banner_cache.nil?
      if banner.width < banner.height
        errors.add :banner, 'El banner de publicidad debe tener mayor anchura que altura'
      elsif banner.width < 1500 || banner.height < 480
        errors.add :banner, 'El banner de publicidad no cumple con las dimensiones mínimas recomendadas: 1500x480'
      end
    end
  end
end

module KepplerProducts
  # Policy for Catalogue model
  class CataloguePolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end

    def create?
    	KepplerProducts::Catalogue.count < 1
    end
  end
end
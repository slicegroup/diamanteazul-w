module KepplerProducts
  # Policy for Design model
  class DesignPolicy < ControllerPolicy
    attr_reader :user, :objects

    def initialize(user, objects)
      @user = user
      @objects = objects
    end

    def create?
    	KepplerProducts::Design.count < 1
    end
  end
end
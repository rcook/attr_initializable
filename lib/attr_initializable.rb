module AttrInitializable
  extend ActiveSupport::Concern

  module ClassMethods
    def attr_initializable(attributes, options = {})
      role = options.delete(:as) || :default
      initializable_attributes[role] ||= []
      initializable_attributes[role] += Array(attributes)
    end

    def initializable_attributes
      @@initializable_attributes ||= {}
    end
  end

  included do
  end

  def mass_assignment_authorizer(role = :default)
    accessible_attributes = super
    accessible_attributes += Array(self.class.initializable_attributes[role]) unless persisted?
    accessible_attributes
  end
end
 
ActiveRecord::Base.send :include, AttrInitializable


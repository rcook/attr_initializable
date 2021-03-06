module AttrInitializable
  extend ActiveSupport::Concern

  module ClassMethods
    def attr_initializable(attributes, options = {})
      unless respond_to?(:protected_attributes)
        raise RuntimeError.new('`attr_initializable` relies on `attr_accessible`. ' \
           'Please add `protected_attributes` to your Gemfile to use `attr_initializable`.')
      end

      role = options.delete(:as) || :default
      initializable_attributes[role] ||= []
      initializable_attributes[role] += Array(attributes)
    end

    def initializable_attributes
      @@initializable_attributes ||= {}
    end
  end

  included do
    def mass_assignment_authorizer(role = :default)
      authorizer = super
      authorizer += Array(self.class.initializable_attributes[role]) unless persisted?
      authorizer
    end
  end
end

ActiveRecord::Base.send :include, AttrInitializable


require 'test_helper'

class AttrInitializableTest < ActiveSupport::TestCase
  test 'default role cannot mass-assign manufacturer at creation time' do
    manufacturer = Manufacturer.create
    assert_raise ActiveModel::MassAssignmentSecurity::Error do
      Widget.new({ :manufacturer_id => manufacturer.id }, :as => :default)
    end
  end

  test 'admin role can mass-assign manufacturer at creation time' do
    manufacturer = Manufacturer.create
    widget = Widget.new({ :manufacturer_id => manufacturer.id }, :as => :admin)
    assert_equal manufacturer, widget.manufacturer
  end

  test 'default role cannot mass-assign manufacturer at update time' do
    manufacturer = Manufacturer.create
    widget = Widget.new(:name => 'name')
    widget.manufacturer = manufacturer
    widget.save!
    assert_equal manufacturer, widget.manufacturer

    assert_raise ActiveModel::MassAssignmentSecurity::Error do
      widget.update_attributes({ :manufacturer_id => Manufacturer.create.id }, :as => :default)
    end
    assert_equal manufacturer, widget.manufacturer
  end

  test 'admin role cannot mass-assign manufacturer at update time' do
    manufacturer = Manufacturer.create
    widget = Widget.new(:name => 'name')
    widget.manufacturer = manufacturer
    widget.save!
    assert_equal manufacturer, widget.manufacturer

    assert_raise ActiveModel::MassAssignmentSecurity::Error do
      widget.update_attributes({ :manufacturer_id => Manufacturer.create.id }, :as => :admin)
    end
    assert_equal manufacturer, widget.manufacturer
  end
end


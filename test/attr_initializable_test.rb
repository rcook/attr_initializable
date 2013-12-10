require 'test_helper'
require 'attr_initializable'
require 'protected_attributes' if TestUtils.is_active_record_4?

ActiveRecord::Base.establish_connection :adapter => 'sqlite3', :database => ':memory:'
ActiveRecord::Base.mass_assignment_sanitizer = :strict

silence_stream(STDOUT) do
  ActiveRecord::Schema.define(:version => 1) do
    create_table :manufacturers, :force => true do |t|
    end

    create_table :widgets, :force => true do |t|
      t.integer :manufacturer_id
      t.string :name
    end
  end
end

class Manufacturer < ActiveRecord::Base
end

class Widget < ActiveRecord::Base
  attr_initializable :manufacturer_id, :as => :admin
  attr_accessible :name

  belongs_to :manufacturer
end

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


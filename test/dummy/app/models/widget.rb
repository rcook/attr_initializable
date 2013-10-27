class Widget < ActiveRecord::Base
  attr_accessible :manufacturer_id, :name

  belongs_to :manufacturer
end

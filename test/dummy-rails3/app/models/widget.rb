class Widget < ActiveRecord::Base
  attr_initializable :manufacturer_id, :as => :admin
  attr_accessible :name

  belongs_to :manufacturer
end


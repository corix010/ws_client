class Vehicle < ActiveRecord::Base
  has_many :checklists
end

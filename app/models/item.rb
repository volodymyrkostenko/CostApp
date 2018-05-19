class Item < ApplicationRecord
  before_save :calculate_total
  belongs_to :category
  belongs_to :project


  def calculate_total
  	self.total = self.count*self.price if self.total.nil?
  end
end
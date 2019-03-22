class Power < ApplicationRecord
  has_many :heroines

  before_save :titleize_name, :capitalize_description

  def titleize_name
    self.name = self.name.titleize
  end

  def capitalize_description
    self.description = self.description.capitalize
  end

  def self.all_names
    self.all.map{|p| p.name}
  end
end

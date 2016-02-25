class Recipe < ActiveRecord::Base

  # serialize the respective fields to automatically store/retrieve hash or array
  serialize :ingredients
  serialize :equipment
  serialize :instructions

  # search recipes
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search}%")
    else
      all
    end
  end

end

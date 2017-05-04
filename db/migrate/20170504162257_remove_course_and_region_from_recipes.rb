class RemoveCourseAndRegionFromRecipes < ActiveRecord::Migration
  def change
    remove_column :recipes, :course_and_region, :string
  end
end

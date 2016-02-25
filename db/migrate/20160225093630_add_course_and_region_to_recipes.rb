class AddCourseAndRegionToRecipes < ActiveRecord::Migration
  def change
    add_column :recipes, :course_and_region, :string
  end
end

class AddCourseToApplicant < ActiveRecord::Migration
  def change
    add_column :applicants, :course, :string

  end
end

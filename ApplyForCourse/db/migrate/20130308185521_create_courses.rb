class CreateCourses < ActiveRecord::Migration
  def change
    create_table :courses do |t|
      t.string :code
      t.string :title
      t.text :description
      t.date :start_date

      t.timestamps
    end
  end
end

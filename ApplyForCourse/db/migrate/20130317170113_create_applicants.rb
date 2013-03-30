class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.string :firstname
      t.string :lastname
      t.string :email
      t.integer :phone_number
      t.integer :course_code

      t.timestamps
    end
  end
end

class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
      t.integer :code
      t.integer :number_of_credits
      t.string :name
      t.integer :number_of_absences
      t.integer :max_number_of_absences
      t.belongs_to :user

      t.timestamps null: false
    end
  end
end

class CreateGrades < ActiveRecord::Migration
  def change
    create_table :grades do |t|
      t.string :name
      t.float :value
      t.float :weight
      t.belongs_to :subject

      t.timestamps null: false
    end
  end
end

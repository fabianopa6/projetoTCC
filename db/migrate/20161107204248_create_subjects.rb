class CreateSubjects < ActiveRecord::Migration
  def change
    create_table :subjects do |t|
    	t.string :name, limit: 60
    	t.string :semester, limit: 15

      t.timestamps null: false
    end
  end
end

class CreateProjects < ActiveRecord::Migration[6.0]
  def change
    create_table :projects do |t|
      t.string :project_name
      t.string :phase
      t.date :award_date
      t.string :pop
      t.string :customer
      t.string :contractor
      t.string :pm
      t.string :status
      t.string :status_comment

      t.timestamps
    end
  end
end

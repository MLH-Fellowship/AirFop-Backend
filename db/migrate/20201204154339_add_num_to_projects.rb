class AddNumToProjects < ActiveRecord::Migration[6.0]
  def change
    add_column :projects, :project_num, :integer
    add_column :projects, :funding_source, :string
  end
end

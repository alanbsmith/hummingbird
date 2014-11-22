class CreateUserProjectsTable < ActiveRecord::Migration
  def change
    create_table :user_projects do |t|
      t.integer  :user_id
      t.integer  :project_id
    end
  end
end

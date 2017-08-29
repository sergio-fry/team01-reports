class CreateAssignees < ActiveRecord::Migration[5.1]
  def change
    create_table :assignees do |t|
      t.string :name
      t.string :jira_login

      t.timestamps
    end
  end
end

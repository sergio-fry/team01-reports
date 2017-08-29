class CreateIssueTimeslips < ActiveRecord::Migration[5.1]
  def change
    create_table :issue_timeslips do |t|
      t.belongs_to :working_day
      t.belongs_to :assignee
      t.string :issue_key
      t.string :component
      t.string :description

      t.timestamps
    end
  end
end

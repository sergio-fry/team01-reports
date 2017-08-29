class CreateWorkingDays < ActiveRecord::Migration[5.1]
  def change
    create_table :working_days do |t|
      t.date :date

      t.timestamps
    end
  end
end

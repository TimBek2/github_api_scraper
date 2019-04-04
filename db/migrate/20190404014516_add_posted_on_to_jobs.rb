class AddPostedOnToJobs < ActiveRecord::Migration[5.2]
  def change
    add_column :jobs, :posted_on, :string
  end
end

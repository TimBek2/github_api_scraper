class FixJobColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :jobs, :type, :job_type
    add_column :jobs, :title, :string
  end
end

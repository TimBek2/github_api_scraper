class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :type
      t.text :url
      t.string :created_at
      t.string :company
      t.string :location
      t.text :description

      t.timestamps
    end
  end
end

class RemoveDoneFromTask < ActiveRecord::Migration[5.1]
  def change
    remove_column :tasks, :done, :boolean
  end
end

class ChangeDefaultStatusForComments < ActiveRecord::Migration[5.1]
  def change
    change_column_default(:comments, :status, 'unapproved')
  end
end

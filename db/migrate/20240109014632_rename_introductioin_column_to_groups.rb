class RenameIntroductioinColumnToGroups < ActiveRecord::Migration[6.1]
  def change
    rename_column :groups, :introductioin, :introduction
  end
end

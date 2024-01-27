class AddDisplayNameToUsers < ActiveRecord::Migration[7.0]
  def up
    add_column :users, :display_name, :string

    query = <<~SQL
      UPDATE users
      SET display_name = username
      WHERE display_name IS NULL
    SQL
    ActiveRecord::Base.connection.execute(query)
  end

  def down
    remove_column :users, :display_name
  end
end

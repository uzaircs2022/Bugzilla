class AddConfirmableToDevise < ActiveRecord::Migration[5.2]
  def up
    User.update_all confirmed_at: DateTime.now
  end

  def down
  end
end

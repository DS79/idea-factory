class AddReferenceToUser < ActiveRecord::Migration
  def change
    add_reference :ideas,    :user, index: true
    add_reference :comments, :user, index: true
  end
end

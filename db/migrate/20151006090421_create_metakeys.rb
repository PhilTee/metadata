class CreateMetakeys < ActiveRecord::Migration
  def change
    create_table :metakeys do |t|
      t.string :name
      t.string :typeof

      t.timestamps null: false
    end
  end
end

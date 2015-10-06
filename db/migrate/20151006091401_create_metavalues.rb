class CreateMetavalues < ActiveRecord::Migration
  def change
    create_table :metavalues do |t|
      t.string :value
      t.belongs_to :user, index: true, foreign_key: true
      t.belongs_to :metakey

      t.timestamps null: false
    end
  end
end

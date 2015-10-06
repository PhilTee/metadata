class CreateFacets < ActiveRecord::Migration
  def change
    create_table :facets do |t|
      t.string :name
      t.text :description
      t.timestamps null: false

    create_table :facets_metakeys, id: false do |t|
      t.belongs_to :facet, index: true
      t.belongs_to :metakey, index: true
    end

    end
  end
end

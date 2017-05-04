# This migration comes from refinery_works (originally 1)
class CreateWorksWorks < ActiveRecord::Migration

  def up
    create_table :refinery_works do |t|
      t.string :title, null: false
      t.integer :image_id, null: false
      t.text :description
      t.string :material
      t.integer :width, null: false
      t.integer :depth
      t.integer :height, null: false
      t.datetime :finished_at, null: false
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-works"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/works/works"})
    end

    drop_table :refinery_works

  end

end

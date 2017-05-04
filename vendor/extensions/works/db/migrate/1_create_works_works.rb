class CreateWorksWorks < ActiveRecord::Migration

  def up
    create_table :refinery_works do |t|
      t.string :title
      t.integer :image_id
      t.text :description
      t.string :material
      t.float :width
      t.float :depth
      t.float :height
      t.datetime :finished_at
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

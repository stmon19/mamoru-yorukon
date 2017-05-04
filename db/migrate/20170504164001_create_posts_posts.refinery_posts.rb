# This migration comes from refinery_posts (originally 1)
class CreatePostsPosts < ActiveRecord::Migration

  def up
    create_table :refinery_posts do |t|
      t.string :title, null: false
      t.integer :image_id, null: false
      t.text :description
      t.datetime :event_start_at
      t.datetime :event_end_at
      t.string :venue
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-posts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/posts/posts"})
    end

    drop_table :refinery_posts

  end

end

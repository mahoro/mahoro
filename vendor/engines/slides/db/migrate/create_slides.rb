class CreateSlides < ActiveRecord::Migration

  def self.up
    create_table :slides do |t|
      t.string :title
      t.integer :image_id
      t.string :link
      t.integer :position

      t.timestamps
    end

    add_index :slides, :id

    load(Rails.root.join('db', 'seeds', 'slides.rb'))

    slide_page = ::Page.find(:first, :conditions => {:link_url => "/slides"})
    slide_page.destroy! if slide_page
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "slides"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/slides"})
    end

    drop_table :slides
  end

end

# frozen_string_literal: true

# This migration comes from refinery_pages (originally 20150720155305)
class UpdateSlugAndTitleInRefineryPageParts < ActiveRecord::Migration
  def change
    ::Refinery::PagePart.all.each do |pp|
      pp.title ||= pp.slug
      pp.slug = pp.slug.downcase.tr(' ', '_')
      pp.save!
    end
  rescue NameError
    warn 'Refinery::PagePart was not defined!'
  end
end

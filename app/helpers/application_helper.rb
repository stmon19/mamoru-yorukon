# frozen_string_literal: true

module ApplicationHelper
  def navigation_tag(text, link_url)
    content_tag(:li, class: ['nav-item', ('active' if current_page?(link_url))].compact) do
      link_to link_url, class: 'nav-link' do
        concat text
        concat content_tag(:span, '(current)', class: 'sr-only') if current_page?(link_url)
      end
    end
  end
end

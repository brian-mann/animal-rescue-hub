module ApplicationHelper

  def title(page_title, options={})
    content_for(:title, page_title.to_s)
    return content_tag(:h1, page_title, options)
  end
  
  def title_head
	  base_title = "Rescue Funder"
	  @title ||= base_title
  end

	def meta_description
   @description ||= "Connecting donors with rescued animals."
  end

end

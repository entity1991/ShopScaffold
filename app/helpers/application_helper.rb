module ApplicationHelper

  def title
    base_title = "Some title"
    if @title.nil?
      base_title
    else
      "#{base_title} | #@title"
    end
  end

  def cut_long_string(content, length)
    clipped_string = sanitize(raw(content.split.map{ |s| wrap_long_string(s) }.join(' ')))
    content.length < length ? clipped_string : clipped_string[0..length-1] + "..."
  end

  def wrap_long_string(text, max_width = 30)
    zero_width_space = "\n"
    regex = /.{1,#{max_width}}/
    (text.length < max_width) ? text : text.scan(regex).join(zero_width_space)
  end

end

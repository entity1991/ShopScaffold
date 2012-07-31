module PaginateHelper

  #def paginate(objects, count = 20, page = 1)
  #  first = count*(page - 1) + 1
  #  objects.first.class.where id: first..first+count-1
  #end
  #
  #def paginate_link
  #  links = "#{link_to '<--Previous ', root_path, :remote => false}"+
  #          "#{link_to ' Next-->', root_path, :remote => false}"
  #  links.html_safe
  #end
end

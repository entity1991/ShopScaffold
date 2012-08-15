module CategoriesHelper
  def categories_names
    cat_names = []
    Category.all.each  do |cat|
      cat_names << cat.name
    end
    cat_names
  end

end

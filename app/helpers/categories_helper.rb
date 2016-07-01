module CategoriesHelper

  def render_options(options, selector)
    @options = options
    render 'categories/subcategories_by_category',
           collection: @options,
           locals: {selector: selector}
  end

end

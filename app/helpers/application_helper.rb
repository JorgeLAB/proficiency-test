module ApplicationHelper

  @links_translate = [:show, :edit, :back, :destroy]
  @titles_translate = [:show, :edit, :index, :new]

  def not_saved_message(errors_count)
    model_translate = t("activerecord.models.#{controller_name.singularize}.one").downcase
    return t("page_content.messages.not_saved.one", model: model_translate ) if errors_count <= 1
    t("page_content.messages.not_saved.other", count: errors_count, model: model_translate)
  end

  def current_resource_in_singular
    t("activerecord.models.#{controller_name.singularize}.one")
  end

  def current_resource_in_plural
    t("activerecord.models.#{controller_name.singularize}.other")
  end

  def current_active_record_attribute
    "activerecord.attributes.#{controller_name.singularize}"
  end

  @links_translate.each do |link|
    define_method "translate_#{link}_link" do
      construct_translate_for_link(link)
    end
  end

  @titles_translate.each do |page|
    define_method "translate_title_of_#{page}_page" do
      construct_translate_for_page(page)
    end
  end

  private

    def construct_translate_for_link(action)
      t("page_content.actions.#{action}", resource: "")
    end

    def construct_translate_for_page(page)
      return t("page_content.actions.list", { resource: current_resource_in_plural } ) if page == :index
      t("page_content.actions.#{page}", { resource: current_resource_in_singular } )
    end
end

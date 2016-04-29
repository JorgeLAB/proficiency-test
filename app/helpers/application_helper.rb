module ApplicationHelper

  @links_translate = [:show, :edit, :back, :destroy]

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

  private

    def construct_translate_for_link(action)
      t("page_content.actions.#{action}", resource: "")
    end
end

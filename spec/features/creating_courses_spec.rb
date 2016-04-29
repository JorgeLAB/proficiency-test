require 'rails_helper'

RSpec.feature "Create courses" do
  scenario "when the user fills the form with valid data" do
    visit '/courses/new'
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.course.one') ) )
    fill_in "course[name]", with: "Any Course"
    fill_in "course[description]", with: "A course to test"
    select "Desativado", from: "course[status]"
    click_button I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.course.one') )
    expect(page).to have_content(I18n.t('flash.actions.create.notice', resource_name: I18n.t('activerecord.models.course.one') ))
  end

  scenario "whem the user try to send the form without student's name" do
    visit '/courses/new'
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.course.one') ) )
    fill_in "course[name]", with: ""
    fill_in "course[description]", with: "A course to tests"
    select "Ativo", from: "course[status]"
    click_button I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.course.one') )
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.course.one') ) )
  end

end

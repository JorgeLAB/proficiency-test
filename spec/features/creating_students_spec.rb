require 'rails_helper'

RSpec.feature "Create students" do
  scenario "when the user fills the form with valid data" do
    visit '/students/new'
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') ) )
    fill_in "student[name]", with: "Anybody name"
    fill_in "student[register_number]", with: "123456789123456789"
    select "Ativo", from: "student[status]"
    click_button I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') )
    expect(page).to have_content(I18n.t('flash.actions.create.notice', resource_name: I18n.t('activerecord.models.student.one') ))
  end

  scenario "whem the user try to send the form without student's name" do
    visit '/students/new'
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') ) )
    fill_in "student[name]", with: ""
    fill_in "student[register_number]", with: "123456789123456789"
    select "Ativo", from: "student[status]"
    click_button I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') )
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') ) )
  end

  scenario "whem the user try to send the form without student's register_name" do
    visit '/students/new'
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') ) )
    fill_in "student[name]", with: "Anybody name"
    fill_in "student[register_number]", with: ""
    select "Ativo", from: "student[status]"
    click_button I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') )
    expect(page).to have_content(I18n.t('page_content.actions.new', resource: I18n.t('activerecord.models.student.one') ) )
  end
end

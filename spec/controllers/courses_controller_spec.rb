require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  describe "GET #index" do
    let(:course) { create :course }

    it "assigns all @courses" do
      get :index
      expect(assigns(:courses)).to eq([course])
    end

    it "renders :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    let(:course) { create :course }

    it "assigns the requested @course" do
      get :show, { id: course.id }
      expect(assigns(:course)).to eq(course)
    end

    it "renders :show template" do
      get :show, { id: course.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new @course" do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end

    it "renders :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    let(:course) { create :course }

    it "assigns the requested @course" do
      get :edit, id: course.id
      expect(assigns(:course)).to eq(course)
    end

    it "renders :edit template" do
      get :edit, id: course.id
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_course) { attributes_for :course }

      it "creates a new Course" do
        expect {
          post :create, course: valid_course
        }.to change(Course, :count).by(1)
      end

      it "persists a new @course" do
        post :create, course: valid_course
        expect(assigns(:course)).to be_persisted
      end

      it "redirects to the created @course" do
        post :create, course: valid_course
        expect(response).to redirect_to(Course.last)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for :course, name: nil }

      it "doesn't create a new Course" do
        expect {
          post :create, course: invalid_attributes
        }.to_not change(Course, :count)
      end

      it "re-renders the 'new' template" do
        post :create, course: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    let(:course) { create :course }

    context "with valid params" do
      it "updates the requested course" do
        patch :update, id: course.id, course: attributes_for(:course, name: "Psycology")
        course.reload
        expect(course[:name]).to eq "Psycology"
      end

      it "assigns the requested course as @course" do
        put :update, id: course.id, course: attributes_for(:course, name: "Psycology")
        course.reload
        expect(assigns(:course)).to eq(course)
      end

      it "redirects to the course" do
        patch :update, id: course.id, course: attributes_for(:course, name: "Psycology")
        expect(response).to redirect_to(course)
      end
    end

    context "with invalid params" do
      it "assigns the course as @course" do
        patch :update, id: course.id, course: attributes_for(:course, name: nil)
        expect(assigns(:course)).to eq(course)
      end

      it "re-renders the 'edit' template" do
        patch :update, id: course.id, course: attributes_for(:course, name: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:course) { create :course }

    it "destroys the requested course" do
      expect {
        delete :destroy, id: course.id
      }.to change(Course, :count).by(-1)
    end

    it "redirects to the courses list" do
      delete :destroy, id: course.id
      expect(response).to redirect_to(courses_url)
    end
  end

end

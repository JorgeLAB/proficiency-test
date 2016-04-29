require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  describe "GET #index" do
    let(:student) { create :student }

    it "assigns all @students" do
      get :index
      expect(assigns(:students)).to eq([student])
    end

    it "renders :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    let(:student) { create :student }

    it "assigns the requested student as @student" do
      get :show, { id: student.id }
      expect(assigns(:student)).to eq(student)
    end

    it "renders :show template" do
      get :show, { id: student.id }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new student as @student" do
      get :new
      expect(assigns(:student)).to be_a_new(Student)
    end

    it "renders :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "GET #edit" do
    let(:student) { create :student }

    it "assigns the requested @student" do
      get :edit, id: student.id
      expect(assigns(:student)).to eq(student)
    end

    it "renders :edit template" do
      get :edit, id: student.id
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_student) { attributes_for :student }

      it "creates a new Student" do
        expect {
          post :create, student: valid_student
        }.to change(Student, :count).by(1)
      end

      it "persists a new @student" do
        post :create, student: valid_student
        expect(assigns(:student)).to be_persisted
      end

      it "redirects to the created @student" do
        post :create, student: valid_student
        expect(response).to redirect_to(Student.last)
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for :student, name: nil }

      it "doesn't create a new Student" do
        expect {
          post :create, student: invalid_attributes
        }.to_not change(Student, :count)
      end

      it "re-renders the 'new' template" do
        post :create, student: invalid_attributes
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    let(:student) { create :student }

    context "with valid params" do
      it "updates the requested student" do
        patch :update, id: student.id, student: attributes_for(:student, name: "Other name")
        student.reload
        expect(student[:name]).to eq "Other name"
      end

      it "assigns the requested student as @student" do
        put :update, id: student.id, student: attributes_for(:student, name: "Other name")
        student.reload
        expect(assigns(:student)).to eq(student)
      end

      it "redirects to the student" do
        patch :update, id: student.id, student: attributes_for(:student, name: "Other name")
        expect(response).to redirect_to(student)
      end
    end

    context "with invalid params" do
      it "assigns the student as @student" do
        patch :update, id: student.id, student: attributes_for(:student, name: nil)
        expect(assigns(:student)).to eq(student)
      end

      it "re-renders the 'edit' template" do
        patch :update, id: student.id, student: attributes_for(:student, name: nil)
        expect(response).to render_template :edit
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:student) { create :student }

    it "destroys the requested student" do
      expect {
        delete :destroy, id: student.id
      }.to change(Student, :count).by(-1)
    end

    it "redirects to the students list" do
      delete :destroy, id: student.id
      expect(response).to redirect_to(students_url)
    end
  end

end

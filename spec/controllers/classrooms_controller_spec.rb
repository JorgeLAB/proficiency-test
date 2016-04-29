require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do

  let(:student) { create :student }
  let(:course) { create :course }

  describe "GET #index" do
    let(:classroom) { create :classroom }

    it "assigns all @classrooms" do
      get :index
      expect(assigns(:classrooms)).to eq([classroom])
    end

    it "renders :index template" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    let(:classroom) { create :classroom }

    it "assigns a @classroom" do
      get :show, id: classroom.id
      expect(assigns(:classroom)).to eq(classroom)
    end

    it "renders :show template" do
      get :show, id: classroom.id
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new @classroom" do
      get :new
      expect(assigns(:classroom)).to be_a_new(Classroom)
    end

    it "renders :new template" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe "POST #create" do
    context "with valid params" do
      let(:valid_classroom) { attributes_for :classroom, student_id: student.id, course_id: course.id }

      it "creates a new Classroom" do
        expect {
          post :create, classroom: valid_classroom
        }.to change(Classroom, :count).by(1)
      end

      it "persists a new @classroom" do
        post :create, classroom: valid_classroom
        expect(assigns(:classroom)).to be_persisted
      end
    end

    context "with invalid params" do
      let(:invalid_attributes) { attributes_for :classroom, student_id: nil }

      it "doesn't create a new Classroom" do
        expect {
          post :create, classroom: invalid_attributes
        }.to_not change(Classroom, :count)
      end

    end
  end

end

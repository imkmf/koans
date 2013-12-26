class Koan
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns title: :string,
          text: :text

end

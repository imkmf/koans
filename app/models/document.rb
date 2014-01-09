class Document
  include MotionModel::Model
  include MotionModel::ArrayModelAdapter

  columns title: :string,
          text: :text,
          category: :string

end

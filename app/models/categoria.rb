class Categoria < ApplicationRecord
    belongs_to :model_visitum, optional: true
end

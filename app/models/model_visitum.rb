class ModelVisitum < ApplicationRecord
    belongs_to :model , :foreign_key => :id_usuario
    belongs_to :lugar, :foreign_key => :id_lugar
    has_many :categorias,:foreign_key =>  :model_visita_id,dependent: :destroy
    accepts_nested_attributes_for :categorias, allow_destroy: true
end

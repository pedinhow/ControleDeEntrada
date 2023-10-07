class Visit < ApplicationRecord
  belongs_to :visitante
  belongs_to :setor
  belongs_to :funcionario, optional: true
end

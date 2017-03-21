class Produto < ApplicationRecord

	belongs_to :departamento

    validates :quantidade, presence: true    
    validates :nome, length: {minimum: 5}
    validates :preco, numericality: {greater_than: 0}

end

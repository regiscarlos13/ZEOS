module Enuns

    def tipos

        case current_user.department.tipo 
        when 'admin'
            tipos = ApplicationRecord.tipos.keys
            @tipos = tipos.select {|num| num != 'admin'}
        when 'Departamento'
            tipos = ApplicationRecord.tipos.keys
            @tipos = tipos.select {|num| num != 'admin' && num != 'Departamento'}
            
        end

    end

    def tipoentrada
        @tipoentradas = ApplicationRecord.tipoentradas.keys
    end
    
    def situation
        @situations = ApplicationRecord.situations.keys
    end

    def cargos
        @cargos = ApplicationRecord.cargos.keys
    end

    def ais
        @aiss = ApplicationRecord.ais.keys
    end
end
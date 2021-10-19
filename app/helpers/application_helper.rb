module ApplicationHelper
    include OutherHelper
    include BtnHelper
    include TableHelper


    def format_cpf(number)
        number.gsub(/\A(\d{3})(\d{3})(\d{3})(\d{2})\Z/, "\\1.\\2.\\3-\\4")
    end

    def format_cep(number)
        number.gsub(/\A(\d{2})(\d{3})(\d{3})\Z/, "\\1.\\2-\\3")
    end
    def format_matricula(number)
        number.gsub(/\A(\d{3})(\d{3})(\d{1})(\d{1})\Z/, "\\1.\\2-\\3-\\4")
    end

    def i18n_yes(campo)
		if campo == true
			content_tag(:span, 'SIM', class: 'badge bg-primary')
		else
			content_tag(:span, 'NÃO', class: 'badge bg-warning')
		end
		
	end

    def situation(campo)
		if campo == 'Enviada'
			content_tag(:span, 'Enviada', class: 'badge bg-primary')
        elsif campo == 'Recebida'
			content_tag(:span, 'Recebida', class: 'badge bg-success')
        else
         content_tag(:span, 'Devolvida', class: 'badge bg-danger')
		end
		
	end

end

import { Controller } from "stimulus"

export default class extends Controller {

    static targets = ["tipo", "dpi", "regional", "ais"]

    initialize() {


        if (this.dpi.value == ''){
            this.dpi_dados.style.visibility = 'hidden'
        }
         if (this.regional.value == ''){
            this.regional_dados.style.visibility = 'hidden'
        }
         if (this.ais.value == ''){
            this.ais_dados.style.visibility = 'hidden'
        }

    }

    search() {
        if (this.tipo.value == 'Municipal') {
            
            this.regional_dados.style.visibility = 'visible'
            this.ais_dados.style.visibility = 'visible'
            this.dpi_dados.style.visibility = 'hidden'

        } else if(this.tipo.value == 'Regional'){

            this.regional_dados.style.visibility = 'hidden'
            this.ais_dados.style.visibility = 'visible'
            this.dpi_dados.style.visibility = 'visible'

        } else if(this.tipo.value == 'Departamento'){

            this.regional_dados.style.visibility = 'hidden'
            this.ais_dados.style.visibility = 'hidden'
            this.dpi_dados.style.visibility = 'hidden'

        }  
        else {
            this.regional_dados.style.visibility = 'hidden'
            this.ais_dados.style.visibility = 'visible'
            this.dpi_dados.style.visibility = 'visible'

        }

    }

    connect() {

    }

    get tipo() { return this.tipoTarget }
    get dpi() { return this.dpiTarget }
    get regional() { return this.regionalTarget }
    get ais() { return this.aisTarget }

    get dpi_dados() {
        return document.getElementsByClassName('department_dpi')[0]
    }
    get regional_dados() {
        return document.getElementsByClassName('department_regional')[0]
    }

    get ais_dados() {
        return document.getElementsByClassName('department_ais')[0]
    }


}
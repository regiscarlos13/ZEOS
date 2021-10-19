import { Controller } from "stimulus"

import '../js/mask'

export default class extends Controller {
    static targets = ["cep", "logradouro", "bairro", "localidade", "uf"]


    initialize() {
        $(this.cep).mask('00.000-000')
        this.logradouro.readOnly = true
        this.bairro.readOnly = true
        this.localidade.readOnly = true
        this.uf.readOnly = true
    }

    search_cep() {
        var online = navigator.onLine
        if (online) {
            var cep = this.cep.value
            cep = cep.replace(/[^\d]+/g, '')
            fetch('https://viacep.com.br/ws/' + cep + '/json/')
                .then(response => {
                    response.json()
                        .then(data => {
                            this.logradouro.value = data.logradouro.toUpperCase(),
                                this.bairro.value = data.bairro.toUpperCase(),
                                this.uf.value = data.uf.toUpperCase(),
                                this.localidade.value = data.localidade.toUpperCase()
                            if (data.logradouro == '') {
                                this.logradouro.readOnly = false
                                this.bairro.readOnly = false
                            } else {
                                this.logradouro.readOnly = true
                                this.bairro.readOnly = true
                            }
                        })
                })

        } else { alert('sem conexão') }
    }


    get cep() { return this.cepTarget }
    get logradouro() { return this.logradouroTarget }
    get bairro() { return this.bairroTarget }
    get localidade() { return this.localidadeTarget }
    get uf() { return this.ufTarget }


}
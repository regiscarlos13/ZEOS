import { Controller } from "stimulus"

import '../js/mask'

export default class extends Controller {
    static targets = ["matricula"]

    initialize() {
        $(this.matricula).mask('000.000-0-0')

    }
    connect() {

    }

    get matricula() { return this.matriculaTarget }



}
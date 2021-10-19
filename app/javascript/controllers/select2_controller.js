import { Controller } from "stimulus"

import 'select2'
import 'select2/dist/css/select2.css'

export default class extends Controller {

    initialize() {
        $('.form-control.select').select2({ width: '100%' })
        $('.form-control.date').select2({ width: '100%' })
        $('.select_tag').select2({ dropdownParent: $('.modal'), width: '100%' })


    }

}
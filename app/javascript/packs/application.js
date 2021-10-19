import Rails from "@rails/ujs"
import "@hotwired/turbo-rails"
import * as ActiveStorage from "@rails/activestorage"
import "channels"


Rails.start()
ActiveStorage.start()



import "controllers"

import $ from 'jquery'
global.$ = $
global.jQuery = $




import 'bootstrap'
import 'bootstrap-icons/font/bootstrap-icons.css'
import '../js/flash_mensagem'

import '../stylesheets/application'
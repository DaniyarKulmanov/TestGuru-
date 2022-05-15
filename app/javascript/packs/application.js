// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//= require jquery3
//= require popper
//= require bootstrap-sprockets
//= require i18n
//= require i18n/translations

import Rails from "@rails/ujs"
import Turbolinks from "turbolinks"
import * as ActiveStorage from "@rails/activestorage"
import "channels"

Rails.start()
Turbolinks.start()
ActiveStorage.start()

require("utilities/sorting")
require("utilities/password_match")
require("utilities/form_inline")
require("utilities/progress_bar")
require("utilities/criteria_parameter")
require("utilities/test_timer")

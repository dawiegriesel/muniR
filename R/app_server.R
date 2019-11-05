#' @import shiny
app_server <- function(input, output,session) {
  # List the first level callModules here
  callModule(mod_mod_muni_select_server, "mod_muni_select_ui_1")
}

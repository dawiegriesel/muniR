# Module UI
  
#' @title   mod_mod_muni_select_ui and mod_mod_muni_select_server
#' @description  A shiny Module.
#'
#' @param id shiny id
#' @param input internal
#' @param output internal
#' @param session internal
#'
#' @rdname mod_mod_muni_select
#'
#' @keywords internal
#' @export 
#' @importFrom shiny NS tagList 
mod_mod_muni_select_ui <- function(id){
  ns <- NS(id)
  tagList(
    uiOutput(ns("muni_selectors"))
  )
}
    
# Module Server
    
#' @rdname mod_mod_muni_select
#' @export
#' @keywords internal
    
mod_mod_muni_select_server <- function(input, output, session){
  ns <- session$ns
  
  munis <- get_munis()
  
  View(sf_local)
  
  output$muni_selectors <- renderUI({
    
    tagList(
      selectInput(ns("select_province"), 
                  "Select Province:", 
                  choices = sort(unique(munis$municipality.province_name)),
                  selected = NULL
                  ),
      selectInput(ns("select_muni"), 
                  "Select Municipality:", 
                  choices = sort(unique(munis$municipality.name)),
                  selected = NULL
                  )
    )
    
  })
  
  observe({
    req(input$select_province)
    x <- input$select_province
    updateSelectInput(session, "select_muni",
                      label = paste("Select a Municipality in ", x),
                      choices = sort(unique(munis[munis$municipality.province_name == x,]$municipality.name))
    )
  })
  
  
  
}
    
## To be copied in the UI
# mod_mod_muni_select_ui("mod_muni_select_ui_1")
    
## To be copied in the server
# callModule(mod_mod_muni_select_server, "mod_muni_select_ui_1")
 

ui <- dashboardPage(
  dashboardHeader(title = "Painel Executivo"),
  dashboardSidebar(
    sidebarMenu(
      menuItem('Agências e Localidades', tabName = 'agencia_local', icon = icon('archway'))
    )
  ),
  dashboardBody(
    tabItems(
     tabItem(tabName = 'agencia_local',
              box(
                solidHeader = T,
                title = 'Área de atuação da agência em Metros',
                status = "info",
                width = 3,
                selectInput('metros', label = 'Raio em Metros', choices = c(500,1000,1500,2000), selected = 500)
              ),
              box(
                solidHeader = F,
                title = 'Agências de Rio Verde, localidades e raio de abrangência',
                background = NULL,
                width = 9,
                height = '100%',
                status = 'info',
                leafletOutput('mapa_agencias', height = 840)
                
              )
      )
    )
  )
)


#ui <- secure_app(ui) #para remover ou incluir a senha, basta alterar esta linha

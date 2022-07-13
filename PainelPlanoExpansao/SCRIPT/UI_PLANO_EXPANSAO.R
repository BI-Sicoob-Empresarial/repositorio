ui <- dashboardPage(
  dashboardHeader(title = "Painel Executivo"),
  dashboardSidebar(
    sidebarMenu(
      menuItem('Agências e Localidades', tabName = 'agencia_local', icon = icon('archway')),
      menuItem('Leads & Prospecção', tabName = 'leads_titulo', icon = icon('handshake'),
               menuSubItem('Excel de Prospecção', tabName = 'leads_excel', icon = icon('table')),
               menuSubItem('Mapa & Localização', tabName = 'leads', icon = icon('map'))
               )
    )
  ),
  dashboardBody(
    tabItems(
     tabItem(tabName = 'agencia_local',
              box(
                solidHeader = T,
                title = 'Área de atação da agência em Metros',
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
      ),
     tabItem(tabName = 'leads_excel',
       box(
         solidHeader = T,
         title = 'Bairros',
         status = "info",
         width = 3,
         selectInput('bairros', label = 'Selecione o Bairro', choices = sort(unique(c(leads$Bairro, 'Todos'))), selected = 'Todos')
           ),
       box(
         solidHeader = F,
         title = 'Dados com os prospecções encontradas',
         background = NULL,
         width = 9,
         status = 'info',
         dataTableOutput('leads_excel')
       )
     ),
     tabItem(tabName = 'leads',
             box(
               solidHeader = F,
               title = 'Projeto Prospectar - Empresas de interesse do Sicoob Empresarial em Rio Verde',
               background = NULL,
               width = 12,
               height = '100%',
               status = 'info',
               leafletOutput('mapa_leads', height = 840)
               
             )
     )
    )
  )
)


#ui <- secure_app(ui) #para remover ou incluir a senha, basta alterar esta linha

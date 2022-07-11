url<-'https://github.com/BI-Sicoob-Empresarial/repositorio/raw/main/Base_Dados/Plano_de_Expansao/agencias_rio_verde.xlsx'
GET(url, write_disk(TF <- tempfile(fileext = ".xlsx")))
agencias_rio_verde = read_excel(TF)

url<-'https://github.com/BI-Sicoob-Empresarial/repositorio/raw/main/Base_Dados/Plano_de_Expansao/ConsolidadoRV%20-%20Tratado.xlsx'
GET(url, write_disk(TF <- tempfile(fileext = ".xlsx")))
leads = read_excel(TF)

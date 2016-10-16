# GitPopJava
App teste para Concrete Solutions

Os requisitos (atingidos!):
Deve conter
Lista de repositórios. Exemplo de chamada na API: https://api.github.com/search/repositories?q=language:Java&sort=stars&page=1
Paginação na tela de lista, com endless scroll / scroll infinito (incrementando o parâmetro page).
Cada repositório deve exibir Nome do repositório, Descrição do Repositório, Nome / Foto do autor, Número de Stars, Número de Forks
Ao tocar em um item, deve levar a lista de Pull Requests do repositório
Pull Requests de um repositório. Exemplo de chamada na API: https://api.github.com/repos/<criador>/<repositório>/pulls
Cada item da lista deve exibir Nome / Foto do autor do PR, Título do PR, Data do PR e Body do PR
Ao tocar em um item, deve abrir no browser a página do Pull Request em questão
A solução DEVE conter
Versão mínima do iOS : 8.*
Arquivo .gitignore
Usar Storyboard e Autolayout
Gestão de dependências no projeto. Ex: Cocoapods
Framework para Comunicação com API. Ex: AFNetwork
Mapeamento json -> Objeto . Ex: Mantle
Ganha + pontos se conter
Testes unitários no projeto. Ex: XCTests / Specta + Expecta
Testes funcionais. Ex: KIF
App Universal , Ipad | Iphone | Landscape | Portrait (Size Classes)
Cache de Imagens. Ex SDWebImage

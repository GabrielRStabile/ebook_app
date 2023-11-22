# eBook App

eBook é um aplicativo para exibição e leitura de livros. Através de uma interface simples é possível fazer tanto a visualização dos livros disponíveis, salvar eles como favorito e também exibir seu conteúdo ao clica-lo.

## Arquitetura
O projeto se divide em três camadas principais de arquitetura:
* `domain`: na camada de domínio reúnem-se o núcleo da lógica de negócios e contém as entidades, regras de negócios e contratos abstratos. Essa camada é independente de qualquer detalhe de implementação específica e não possuí nenhuma dependência com pacotes externos.
* `infra`: na camada de infra contém providers que realizam acesso à APIs externas, repositories que interagem com o próprio dispositivo, models que representam a classe de resposta de cada provider com os métodos de desserialização e que transformam o modelo em uma entidade.
* `presentation`: a última camada está relacionada à interface do usuário e à apresentação de informações para o usuário. Ela lida com a lógica da interface do usuário, como a criação de páginas, manipulação de rotas e gerenciamento de estados.

## Funcionalidades
1. Baixar Lista de Livros e Capas
O aplicativo acessa uma API para obter uma lista atualizada de livros.
2. Estante de Livros
Exibe as capas dos livros baixados de forma organizada em uma estante virtual.
3. Download e Armazenamento de Livros
Permite que o usuário baixe um livro ao tocar em sua capa e salve o arquivo no dispositivo.
4. Exibição de Livros
Utiliza o package [Vocsy Epub Viewer](https://pub.dev/packages/vocsy_epub_viewer) para exibir o conteúdo do livro.

## Tecnologias
Esse projeto utiliza as seguintes tecnologias:
* Navegação: [flutter_modular](https://pub.dev/packages/flutter_modular)
* Requisições HTTP: [dio](https://pub.dev/packages/dio)
* Utilitários de design: [widget_mask](https://pub.dev/packages/widget_mask) | [material_color_utilities](https://pub.dev/packages/material_color_utilities) | [google_fonts](https://pub.dev/packages/google_fonts)
* Persistência de dados: [hive](https://pub.dev/packages/hive)


## Como Rodar
Certifique-se de ter o Flutter instalado em seu sistema. Se não tiver você pode instala-lo [clicando aqui](https://docs.flutter.dev/get-started/install)

1. Clone este repositório: `git clone https://github.com/GabrielRStabile/ebook_app.git`
2. Navegue até o diretório do projeto: `cd ebook_app`
3. Execute o comando: `flutter run`

Como alternativa também é possível baixar o arquivo .APK diretamente na aba Releases do Github.

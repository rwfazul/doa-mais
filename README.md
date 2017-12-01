# doaMais

Este projeto tem sua ideia central focada no auxílio de agendamentos de doações de sangue à hemocentros dedicados. Entre suas funções básica é possível a realização de agendamento de doações de sangue em hemocentros da localidade. Também existe a possibilidade, por parte de hemocentros, de registrarem o tipo sanguíneo que está sendo mais necessário para doação, assim possibilitando aos usuários visualizarem quais hemocentros estão com alerta de urgência do seu tipo sanguíneo em específico.<br/>
Em complemento, pensando em eventos de doações de sangue que ocorrem nas localidades, será possível o cadastro e visualização de eventos futuros na região, permitindo aos usuários o agendamento de turno e horário para doação no evento, diminuindo assim o tempo de espera e as grandes filas que normalmente ocorrem em atividades deste tipo.

#### Estrutura do código:
- Padrões Java (nomenclatura de classes, métodos e atributos);
- Arquitetura MVC;
- Utilização do Spring;
- Projeto estruturado no maven.

#### Instalação e uso
- Executar script para criação do banco de dados no PostgreSQL (br/csi/banco/sql/doaMais_ddl.sql) e, se desejável iniciar com alguns registros pré-inseridos, executar o script doaMais_dml.sql;
- A classe BD.java dentro do pacote ‘banco' devem ser modificada de acordo com a configuração da base de dados (user e password);
- A inserção e o gerenciamento de hemocentros é uma funcionalidade que está disponível apenas aos administradores do sistema. O painel administrativo pode ser encontrado em doaMais/dm-admin. Se executado o script de inserção dos dados (doaMais_dml.sql), o usuário administrador default possuirá login: admin e password: admin.
- As dependências são gerenciadas pelo Maven, logo não é preciso adicionar nenhum .JAR na build path do projeto.

------------------------------------------------------------------

#### Dev
- Relatório projeto desenvolvido. Nesse relatório deve constar a descrição do sistema. Também deve existir uma seção com instruções de como instalar e utilizar o software.
	+ [x] Apresentação e modelagem;
- Requisitos de Uso do sistema:
	+ [x] O sistema deve ter no mínimo 3 CRUDs (Create, Read, Update, Delete), autenticação por login não vale como CRUD;
	+ [x] O sistema deve ter implementado Layouts;
	+ [x] Realizar validação dos formulários;
	+ [x] O sistema deve ter alguma tela que faz o processamento das informações inseridas no CRUD, por exemplo, vendas, relatórios, financeiro, etc.. 
	+ [x] O sistema deve controlar a sessão do usuário;
	+ [x] Requisitos de Estrutura do código: Padrões Java (nomenclatura de classes, métodos e atributos), arquitetura MVC, utilização do Spring, projeto estruturado no maven, banco de dados deve com chaves estrangeiras.

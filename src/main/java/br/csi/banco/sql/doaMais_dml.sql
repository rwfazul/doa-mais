INSERT INTO usuario 
VALUES	(default, 'admin@mail.com', 'admin'),
	(default, 'teste01@mail.com', 123123), 
	(default, 'teste02@mail.com', 123123), 
	(default, 'teste03@mail.com', 123123), 
	(default, 'teste04@mail.com', 123123), 
	(default, 'teste05@mail.com', 123123);

INSERT INTO admin_sistema 
VALUES	(1, 'admin');

INSERT INTO doador
VALUES  (1, 'Pedro', '222.400.555-49', '1997-06-05', 'm', '(55) 0000-0000', '97195-000', 'A+', 50, true, 1, 'Não', 'N/A'),
	(2, 'Jose', '222.400.555-60', '1997-06-05', 'm', '(55) 0000-0000', '97195-000', 'A-', 50, true, 1, 'Não', 'N/A'),
	(3, 'Carlos', '222.400.555-65', '1997-06-05', 'm', '(55) 0000-0000', '97195-000', 'AB+', 50, true, 1, 'Não', 'N/A'),
	(4, 'Maria', '222.400.555-98', '1997-06-05', 'f', '(55) 0000-0000', '97195-000', 'O+', 50, true, 1, 'Não', 'N/A'),
	(5, 'Beatriz', '222.400.555-55', '1997-06-05', 'f', '(55) 0000-0000', '97195-000', 'O+', 50, true, 1, 'Não', 'N/A');

INSERT INTO hemocentro
VALUES	(default, 'Hemocentro Regional de Santa Maria', 'Rua Joaquim Barbosa', '97195-000', '(55) 3222-1184', 'hemo@mail.com', 'fb/sm', 'www.sm.com'),
	(default, 'Hemocentro Silveira Martins', 'Rua Joaquim Barbosa', '97195-000', '(55) 3222-1184', 'hemo@mail.com', 'fb/sm', 'www.sm.com'),
	(default, 'Hemocentro Regional de Agudo', 'Rua Joaquim Barbosa', '97195-000', '(55) 3222-1184', 'hemo@mail.com', 'fb/sm', 'www.sm.com'),
	(default, 'Hemocentro Regional de Nova Palma', 'Rua Joaquim Barbosa', '97195-000', '(55) 3222-1184', 'hemo@mail.com', 'fb/sm', 'www.sm.com'),
	(default, 'Hemocentro Porto Alegre', 'Rua Joaquim Barbosa', '97195-000', '(55) 3222-1184', 'hemo@mail.com', 'fb/sm', 'www.sm.com');

INSERT INTO alerta
VALUES	(default, 1, 'A+', '2017-10-10', true, 100, 'Grau de urgência elevado'), 
	(default, 2, 'A+', '2017-10-10', true, 90, ''),
	(default, 3, 'O+', '2017-10-10', true, 80, ''),
	(default, 4, 'O+', '2017-10-10', true, 70, 'Necessário para transfução de emergência'),
	(default, 5, 'AB+', '2017-10-10', true, 60, '');

INSERT INTO evento
VALUES	(default, 1, 'CirculacaoUFSM', 'Evento de doacao de sangue realizado em Santa Maria na UFSM', '2017-06-05', '08h00m - 16h00m', 'UFSM', '97195-000', 0),
	(default, 1, 'DOASangue', 'Evento de doacao de sangue realizado em Santa Maria na UFSM', '2018-06-05', '08h00m - 16h00m', 'UFSM', '97195-000', 0),
	(default, 2, 'DOAUFSM', 'Evento de doacao de sangue realizado em Santa Maria na UFSM', '2018-06-08', '08h00m - 16h00m', 'UFSM', '97195-000', 0),
	(default, 3, 'DoeMais', 'Evento de doacao de sangue realizado em Santa Maria na UFSM', '2018-06-05', '08h00m - 16h00m', 'UFSM', '97195-000', 0),
	(default, 4, 'VenhaDoar', 'Evento de doacao de sangue realizado em Santa Maria na UFSM', '2018-06-05', '08h00m - 16h00m', 'UFSM', '97195-000', 0);

INSERT INTO agendamento
VALUES	(default, 1, 1, '2017-06-05', '10h00m - 12h00m', 1, 'N/A'),
	(default, 2, 2, '2018-09-05', '10h00m - 12h00m', 2, 'N/A'),
	(default, 3, 2, '2018-08-05', '10h00m - 12h00m', 3, 'N/A'),
	(default, 3, 3, '2018-06-05', '12h00m - 14h00m', 1, 'N/A'),
	(default, 2, 4, '2018-07-05', '18h00m - 120h00m', null, 'N/A');
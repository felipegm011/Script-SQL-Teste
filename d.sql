create procedure sp_livros()
	select * from livro;
    call sp_livros;
    
create procedure sp_edit()
	select * from editora;
    call sp_edit;
    
create procedure sp_msg()
	select 'está aula é teste' as mensagem;
    call sp_msg;
    
CREATE PROCEDURE sp_cone(IN p_sigla char(2), IN p_nome varchar(255))
INSERT INTO assunto (sigla,nome) values (p_sigla, p_nome);
CALL sp_cone('ID', 'Direito');
    
CREATE PROCEDURE sp_consultas()
	SELECT livro.codigo, livro.titulo, livro.valor, livro.ano FROM livro,editora
    WHERE editora.codigo = livro.editora AND editora.nome='Pearson';
CALL sp_consultas;


-- atividade 1
CREATE PROCEDURE sp_consultas1()
	SELECT livro.codigo, livro.titulo, livro.valor, livro.ano, assunto.nome FROM livro,assunto
    WHERE assunto.sigla = livro.assunto;
CALL sp_consultas1;

-- atividade 2
CREATE PROCEDURE sp_atualiza4()
	UPDATE livro SET valor = valor * 1.15
    WHERE assunto NOT IN('RC','BD');
CALL sp_atualiza4;

-- atividade 3

CREATE PROCEDURE sp_consultadt1()
	SELECT COUNT(*) AS QTD_PEDIDOS FROM pedido
    WHERE dataentrada = '2016-08-21';
CALL sp_consultadt1;


-- atividade 5

CREATE PROCEDURE sp_consultauser()
	SELECT livro.titulo, assunto.nome FROM livro 
	INNER JOIN assunto ON livro.assunto = assunto.sigla
	WHERE livro.valor >= 150;
CALL sp_consultauser;


create table venda(
	id int primary key,
    assuntos varchar(255),
    preco numeric(10,0),
    dtsaida date,
    foreign key (assuntos) references assunto(nome),
    foreign key (preco) references livro(valor)
);








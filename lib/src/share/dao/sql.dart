class ConnectionSQL{
  static const createDatabase = '''
  CREATE TABLE `TB_CLIENTE`(
    `ID` INTEGER PRIMARY KEY AUTOINCREMENT, 
    `NOME` TEXT NOT NULL, 
    `CPF` TEXT NOT NULL, 
    `TELEFONE` TEXT NOT NULL, 
    `ENDERECO` TEXT NOT NULL,
    `BAIRRO` TEXT NOT NULL,
    `CEP` TEXT NOT NULL
  );
  
  CREATE TABLE `TB_PRODUTO`(
    `ID` INTEGER PRIMARY KEY AUTOINCREMENT, 
    `NOME` TEXT NOT NULL, 
    `PRECO` REAL NOT NULL, 
    `QUANTIDADE` INTEGER NOT NULL, 
    `DESCRICAO` TEXT NOT NULL
  );
  
 CREATE TABLE `TB_FORNECEDOR`(
    `ID` INTEGER PRIMARY KEY AUTOINCREMENT, 
    `NOME` TEXT NOT NULL, 
    `CNPJ` TEXT NOT NULL, 
    `TELEFONE` TEXT NOT NULL, 
    `ENDERECO` TEXT NOT NULL,
    `BAIRRO` TEXT NOT NULL,
    `CEP` TEXT NOT NULL
  );  
  ''';

  // ====================== ADD ======================

  static String addClient() => '''
  INSERT INTO TB_CLIENTE (NOME, CPF, TELEFONE, ENDERECO, BAIRRO, CEP) VALUES (?, ?, ?, ?, ?, ?);
  ''';

  static String addProduct() => '''
  INSERT INTO TB_PRODUTO (NOME, PRECO, QUANTIDADE, DESCRICAO) VALUES (?, ?, ?, ?);
  ''';

  static String addProvider() => '''
  INSERT INTO TB_FORNECEDOR (NOME, CNPJ, TELEFONE, ENDERECO, BAIRRO, CEP) VALUES (?, ?, ?, ?, ?, ?);
  ''';

  // ====================== UPDATE ======================

  static String updateClient() => '''
  UPDATE TB_CLIENTE SET NOME = ?, CPF = ?, TELEFONE = ?, ENDERECO = ?, BAIRRO = ?, CEP = ? WHERE ID = ?;
  ''';

  static String updateProduct() => '''
  UPDATE TB_PRODUTO SET NOME = ?, PRECO = ?, QUANTIDADE = ?, DESCRICAO = ? WHERE ID = ?;
  ''';

  static String updateProvider() => '''
  UPDATE TB_FORNECEDOR SET NOME = ?, CNPJ = ?, TELEFONE = ?, ENDERECO = ?, BAIRRO = ?, CEP = ? WHERE ID = ?;
  ''';

  // ====================== SELECT ALL ======================

  static String selectAllClient() => '''
  SELECT * FROM TB_CLIENTE;
  ''';

  static String selectAllProduct() => '''
  SELECT * FROM TB_PRODUTO;
  ''';

  static String selectAllProvider() => '''
  SELECT * FROM TB_FORNECEDOR;
  ''';

  // ====================== DELETE ======================

  static String deleteClient() => '''
  DELETE FROM TB_CLIENTE WHERE ID = ?;
  ''';

  static String deleteProduct() => '''
  DELETE FROM TB_PRODUTO WHERE ID = ?;
  ''';

  static String deleteProvider() => '''
  DELETE FROM TB_FORNECEDOR WHERE ID = ?;
  ''';

  // ====================== SELECT BY ID ======================

  static String selectClientById() => '''
  SELECT * FROM TB_CLIENTE WHERE ID = ?;
  ''';

  static String selectProductById() => '''
  SELECT * FROM TB_PRODUTO WHERE ID = ?;
  ''';

  static String selectProviderById() => '''
  SELECT * FROM TB_FORNECEDOR WHERE ID = ?;
  ''';

}
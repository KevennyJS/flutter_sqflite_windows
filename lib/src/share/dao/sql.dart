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
    `ESTOQUE` INTEGER NOT NULL, 
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
  
  CREATE TABLE TB_FORMA_PAGAMENTO(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    NAME TEXT NOT NULL
  );
  
  CREATE TABLE TB_VENDA(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_CLIENTE INTEGER NOT NULL,
    ID_FORMA_PAGAMENTO INTEGER NOT NULL,
    DATA_VENDA TEXT NOT NULL,
    FOREIGN KEY(ID_CLIENTE) REFERENCES TB_CLIENTE(ID),
    FOREIGN KEY(ID_FORMA_PAGAMENTO) REFERENCES TB_FORMA_PAGAMENTO(ID)
  );
  
  CREATE TABLE TB_VENDA_PRODUTO(
    ID_VENDA INTEGER NOT NULL,
    ID_PRODUTO INTEGER NOT NULL,
    VALOR REAL NOT NULL,
    QUANTIDADE REAL NOT NULL,
    FOREIGN KEY(ID_VENDA) REFERENCES TB_VENDA(ID),
    FOREIGN KEY(ID_PRODUTO) REFERENCES TB_PRODUTO(ID),
  );
  
  CREATE TABLE TB_COMPRA(
    ID INTEGER PRIMARY KEY AUTOINCREMENT,
    ID_FORNECEDOR INTEGER NOT NULL,
    ID_FORMA_PAGAMENTO INTEGER NOT NULL,
    DATA_COMPRA TEXT NOT NULL,
    FOREIGN KEY(ID_FORNECEDOR) REFERENCES TB_FORNECEDOR(ID)
  );
  
  CREATE TABLE TB_COMPRA_PRODUTO(
    ID_COMPRA INTEGER NOT NULL,
    ID_PRODUTO INTEGER NOT NULL,
    VALOR REAL NOT NULL,
    QUANTIDADE REAL NOT NULL,
    FOREIGN KEY(ID_COMPRA) REFERENCES TB_COMPRA(ID),
    FOREIGN KEY(ID_PRODUTO) REFERENCES TB_PRODUTO(ID),
  );
  ''';

  // ====================== ADD ======================

  static String addClient() => '''
  INSERT INTO TB_CLIENTE (NOME, CPF, TELEFONE, ENDERECO, BAIRRO, CEP) VALUES (?, ?, ?, ?, ?, ?);
  ''';

  static String addProduct() => '''
  INSERT INTO TB_PRODUTO (NOME, PRECO, ESTOQUE, DESCRICAO) VALUES (?, ?, ?, ?);
  ''';

  static String addProvider() => '''
  INSERT INTO TB_FORNECEDOR (NOME, CNPJ, TELEFONE, ENDERECO, BAIRRO, CEP) VALUES (?, ?, ?, ?, ?, ?);
  ''';

  static String addPaymentMethod() => '''
  INSERT INTO TB_FORMA_PAGAMENTO (NAME) VALUES (?);
  ''';

  // ====================== UPDATE ======================

  static String updateClient() => '''
  UPDATE TB_CLIENTE SET NOME = ?, CPF = ?, TELEFONE = ?, ENDERECO = ?, BAIRRO = ?, CEP = ? WHERE ID = ?;
  ''';

  static String updateProduct() => '''
  UPDATE TB_PRODUTO SET NOME = ?, PRECO = ?, ESTOQUE = ?, DESCRICAO = ? WHERE ID = ?;
  ''';

  static String updateProvider() => '''
  UPDATE TB_FORNECEDOR SET NOME = ?, CNPJ = ?, TELEFONE = ?, ENDERECO = ?, BAIRRO = ?, CEP = ? WHERE ID = ?;
  ''';

  static String updatePaymentMethod() => '''
  UPDATE TB_FORMA_PAGAMENTO SET NAME = ? WHERE ID = ?;
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

  static String selectAllPaymentMethod() => '''
  SELECT * FROM TB_PAYMENT_METHOD;
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

  static String deletePaymentMethod() => '''
  DELETE FROM TB_PAYMENT_METHOD WHERE ID = ?;
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

  static String selectPaymentMethodById() => '''
  SELECT * FROM TB_PAYMENT_METHOD WHERE ID = ?;
  ''';


}
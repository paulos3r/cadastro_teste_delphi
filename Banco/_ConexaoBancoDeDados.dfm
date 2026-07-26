object dmConexaoOracle: TdmConexaoOracle
  OnCreate = DataModuleCreate
  Height = 320
  Width = 485
  object zConexaoO: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP'
      'connect_timeout=10'#10
      'read_timeout=10')
    DisableSavepoints = False
    HostName = '10.1.100.220'
    Port = 1521
    Database = '//10.1.100.220:1521/SANTRIORCL'
    User = 'VENDAS'
    Password = 'VENDAS'
    Protocol = 'oracle'
    LibraryLocation = 'C:\oracle\instantclient_21_20\oci.dll'
    Left = 72
    Top = 64
  end
  object zConexao: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    DisableSavepoints = False
    HostName = ''
    Port = 3306
    Database = 'vendas'
    User = 'root'
    Password = 'DADOS'
    Protocol = 'mysql'
    LibraryLocation = 'C:\Program Files (x86)\MySQL\MySQL Server 5.7\lib\libmysql.dll'
    Left = 224
    Top = 64
  end
end

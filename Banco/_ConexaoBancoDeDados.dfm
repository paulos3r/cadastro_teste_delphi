object dmConexaoOracle: TdmConexaoOracle
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object zConexao: TZConnection
    ControlsCodePage = cCP_UTF16
    Catalog = ''
    Properties.Strings = (
      'RawStringEncoding=DB_CP')
    DisableSavepoints = False
    HostName = '10.1.100.220'
    Port = 1521
    Database = '//10.1.100.220:1521/SANTRIORCL'
    User = 'VENDAS'
    Password = 'VENDAS'
    Protocol = 'oracle'
    LibraryLocation = 'D:\projetos\cadastro_teste_delphi\lib\old\oci.dll'
    Left = 248
    Top = 216
  end
end

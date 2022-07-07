from ModBus_Communication import OperaMetrix_ModbusTCP_client
from time import sleep

# while (1):
#     addr = int(input("\nEntrer l'adresse de lecture: "))
#     Read_addr(83)
#     sleep(2)

Myclient = OperaMetrix_ModbusTCP_client()
Myclient.connect()
testa = 113
typeaddr = "bool"
a = Myclient.Read_addr(testa,typeaddr)
sleep(1)
Myclient.Write_addr(testa,True,typeaddr)
sleep(1)
Myclient.Read_addr(testa,typeaddr)
# sleep(1)
# Myclient.Write_addr(testa,a)
# sleep(1)
# Myclient.Read_addr(testa)
Myclient.close()

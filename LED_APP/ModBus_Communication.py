from optparse import Values
from pymodbus3.client.sync import ModbusTcpClient
from pymodbus3.constants import Endian
from pymodbus3.payload import BinaryPayloadDecoder, BinaryPayloadBuilder
import logging
from time import sleep

# --------------------------------------------------------------------------- #
# log config
# --------------------------------------------------------------------------- #
FORMAT = (
    "%(asctime)-15s %(threadName)-15s "
    "%(levelname)-8s %(module)-15s:%(lineno)-8s %(message)s"
)
logging.basicConfig(format=FORMAT)
log = logging.getLogger()
log.setLevel(logging.DEBUG)



UNIT = 0x01

class OperaMetrix_ModbusTCP_client():
    def __init__(self,host='192.168.0.90'):
        self.client = ModbusTcpClient(host)

    def conect(self):
        # --------------------------------------------------------------------------- #
        # Configuration et connexion au client
        # --------------------------------------------------------------------------- #
        self.client.connect()
        log.debug("Connected to the client")

    def close(self): 
        # --------------------------------------------------------------------------- #
        # Close client
        # --------------------------------------------------------------------------- #
        self.client.close()
        log.debug("disconnected from client")   

    def Read_addr(self,addr,Type = 'float'):
        """ Allows to read a value from modbus API with IP address 192.168.0.90 
        ## Pameters:
        - addr:  the address of the infomation you want to read
        - Type: ( default : 'float' ) the type of data stored at this address: 
            - you can specify float, string, bool, 16 uint or 8int
        ## Returns:
        - value of the address asked
        """
        # --------------------------------------------------------------------------- #
        # Test lecture et décodage Modbus
        # --------------------------------------------------------------------------- #
        response = self.client.read_holding_registers(addr,count=3)
        log.debug(f"\n Voici la réponse brute de PyModbus: {response}\n")
        decoder = BinaryPayloadDecoder.from_registers(registers=response.registers, endian=Endian.Big)
        log.debug(f"Voici le décoder: {decoder}")
        if Type == 'float':
            value = decoder.decode_32bit_float()
        elif Type == 'string':
            value = decoder.decode_string(8)
        elif Type == 'bool':
            value = decoder.decode_bits()
        elif Type == '16uint':
            value = decoder.decode_16bit_uint()
        elif Type == '8int':
            value = decoder.decode_8bit_int()
        log.debug (f"\033[1;31;1m \nHere is the response: {value}\n")
        # --------------------------------------------------------------------------- #
        # Close client
        # --------------------------------------------------------------------------- #
        return value

    def Read_all_addr(self):
        """Allows to read all 120 addresses from the API
        # Returns:
        - list of 120 rows of things contined in the addresses and 2 columns ( address / actual value )
        """
        A_float = [x for x in range(0,54,2)]
        B_bool = [54, 54.05 , 54.1]
        C_float = [x for x in range(55,77,2) ]
        D_bool = [75 , 75.05 , 75.1]
        E_float = [76,78,80] 
        F_bool = [82]
        G_float = [x for x in range(83,113,2)]
        H_bool = [113]
        I_uint = [114]
        J_usint = [x for x in range(115,118,0.5)]
        K_udint = [118]
        L_bool = [120]
        VALUES = [[],[]]
        for i in A_float:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'float'))
        for i in B_bool:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'bool'))
        for i in C_float:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'float'))
        for i in D_bool:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'bool'))
        for i in E_float:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'float'))
        for i in F_bool:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'bool'))
        for i in G_float:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'float'))
        for i in H_bool:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'bool'))
        # for i in I_uint:
        #     VALUES[0].append(i)
        #     VALUES[1].append(self.Read_addr(i,'float'))
        # for i in J_usint:
        #     VALUES[0].append(i)
        #     VALUES[1].append(self.Read_addr(i,'float'))
        # for i in K_udint:
        #     VALUES[0].append(i)
        #     VALUES[1].append(self.Read_addr(i,'bool'))
        for i in L_bool:
            VALUES[0].append(i)
            VALUES[1].append(self.Read_addr(i,'bool'))
    
    def Write_addr(self,addr,object):
        """ Allows to write a value to a modbus API with IP address 192.168.0.90 
        ## Pameters:
        - addr:  the address of the infomation you want to write
        - object: the type of data you want to be stored at this address
        """
        # --------------------------------------------------------------------------- #
        # écriture
        # --------------------------------------------------------------------------- #
        builder = BinaryPayloadBuilder(endian = Endian.Big)
        builder.add_32bit_float(object)
        payload = builder.buil
        self.client.write_register(addr,payload,skip_encode=True)
        
  

# while (1):
#     addr = int(input("\nEntrer l'adresse de lecture: "))
#     Read_addr(83)
#     sleep(2)

# Myclient = OperaMetrix_ModbusTCP_client()
# Myclient.connect()
# testa = 101
# Myclient.Read_addr(testa)
# sleep(1)
# Myclient.Write_addr(testa,3.12)
# sleep(1)
# Myclient.Read_addr(testa)
# Myclient.close()

while(1):
    Myclient = OperaMetrix_ModbusTCP_client()
    ans = int(input(F"\nSouhaitez vous lire (0) ou écrire (1)"))
    if ans == 0:
        Myclient.conect()
        addr = int(input("\nEntrer l'adresse de lecture: "))
        Myclient.Read_addr(addr) 
        Myclient.close()
        sleep(2)
    elif ans == 1 :
        Myclient.conect()
        addr = int(input("\nEntrer l'adresse d'écriture: "))
        obj = int(input("\nEntrer la valeur à écrire: "))
        Myclient.Write_addr(addr,obj) 
        Myclient.close()
        sleep(2)



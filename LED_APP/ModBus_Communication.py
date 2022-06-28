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

def Read_addr(addr,Type = 'float'):
    """ Allows to read a value from modbus API with IP address 192.168.0.90 
    ## Pameters:
    - addr:  the address of the infomation you want to read
    - Type: ( default : 'float' ) the type of data stored at this address: 
        - you can specify float, string, bool, 16 uint or 8int
    ## Returns:
    - value of the address asked
    """
    # --------------------------------------------------------------------------- #
    # Configuration et connexion au client
    # --------------------------------------------------------------------------- #
    log.debug("Connecting to the client...")
    client = ModbusTcpClient(host='192.168.0.90')
    client.connect()
    log.debug("Connected to the client")
    # --------------------------------------------------------------------------- #
    # Test lecture et décodage Modbus
    # --------------------------------------------------------------------------- #
    response = client.read_holding_registers(addr,count=3)
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
    client.close()
    return value

def Read_all_addr():
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
        VALUES[1].append(Read_addr(i,'float'))
    for i in B_bool:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'bool'))
    for i in C_float:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'float'))
    for i in D_bool:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'bool'))
    for i in E_float:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'float'))
    for i in F_bool:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'bool'))
    for i in G_float:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'float'))
    for i in H_bool:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'bool'))
    # for i in I_uint:
    #     VALUES[0].append(i)
    #     VALUES[1].append(Read_addr(i,'float'))
    # for i in J_usint:
    #     VALUES[0].append(i)
    #     VALUES[1].append(Read_addr(i,'float'))
    # for i in K_udint:
    #     VALUES[0].append(i)
    #     VALUES[1].append(Read_addr(i,'bool'))
    for i in L_bool:
        VALUES[0].append(i)
        VALUES[1].append(Read_addr(i,'bool'))
    
def Write_addr(addr,object):
    """ Allows to write a value to a modbus API with IP address 192.168.0.90 
    ## Pameters:
    - addr:  the address of the infomation you want to write
    - object: the type of data you want to be stored at this address
    """
    # --------------------------------------------------------------------------- #
    # Configuration et connexion au client
    # --------------------------------------------------------------------------- #
    log.debug("Connecting to the client...")
    client = ModbusTcpClient(host='192.168.0.90')
    client.connect()
    log.debug("Connected to the client")
    # --------------------------------------------------------------------------- #
    # écriture
    # --------------------------------------------------------------------------- #
    builder = BinaryPayloadBuilder(endian = Endian.Big)
    builder.add_32bit_float(object)
    payload = builder.build
    
    client.write_register(addr,payload,skip_encode=True)
    # --------------------------------------------------------------------------- #
    # Close client
    # --------------------------------------------------------------------------- #
    client.close() 
    
    

# while (1):
#     addr = int(input("\nEntrer l'adresse de lecture: "))
#     Read_addr(83)
#     sleep(2)


testa = 101
Read_addr(testa)
sleep(1)
Write_addr(testa,3.12)
sleep(1)
Read_addr(testa)
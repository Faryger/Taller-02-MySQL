CALL InsertTipDocum ("TI");
CALL InsertTipDocum ("CC");
CALL InsertTipDocum ("CE");

CALL InsertRH ("O+");
CALL InsertRH ("O-");
CALL InsertRH ("A+");
CALL InsertRH ("A-");
CALL InsertRH ("B+");
CALL InsertRH ("B-");
CALL InsertRH ("AB+");
CALL InsertRH ("AB-");

CALL InsertRol ("Barbero");
CALL InsertRol ("Estilista");
CALL InsertRol ("Recepcionista");
CALL InsertRol ("Aseador");
CALL InsertRol ("Vendedor");
CALL InsertRol ("Guardia");


CALL InsertSer ("Corte cabello corto",50.000);
CALL InsertSer ("Corte cabello medio",70.000);
CALL InsertSer ("Corte cabello largo",90.000);
CALL InsertSer ("Barba corta",25.000);
CALL InsertSer ("barba media",50.000);
CALL InsertSer ("Barba larga",70.000);
CALL InsertSer ("Keratina",2000.000);
CALL InsertSer ("Tintura cabello corto",80.000);
CALL InsertSer ("Tintura cabello medio",120.000);
CALL InsertSer ("Tintura cabello largo",200.000);
CALL InsertSer ("Corte dama cabello corto",40.000);
CALL InsertSer ("Corte dama cabello medio",60.000);
CALL InsertSer ("Corte dama cabello largo",90.000);

CALL InsertProduct ("GEL",10.000);
CALL InsertProduct ("CERA",15.000); 
CALL InsertProduct ("SHAMPOO",50.000); 
CALL InsertProduct ("MASCARILLA",50.000); 
CALL InsertProduct ("ACONDICIONADOR",50.000); 

-- debiles
CALL InsertPer("Alejandro","Moreno","Amaya",1019035234,3000000000,"Carrera Sol 12",1,1,1);
CALL InsertPer("Robinson","Puentes","Alarcon",1023845234,3199448503,"Calle 23 A5",2,1,2);
CALL InsertPer("Tomas","Laguna","Acevedo",31998477429,319847930,"Calle Cancun 45",3,4,6);

CALL InsertCl ("Santiago","Torres",3980000,9990000,2,1);
CALL InsertCl ("Simon","Diaz",3140000,9790800,1,3);

CALL InsertFac (10);
CALL InsertFac (12);
CALL InsertFac (13);
CALL InsertFac (14);

CALL InsertVen (1,3,1);
CALL InsertVen (2,1,2);

CALL InsertdetVP (1,2);


CALL InsertdetVS (1,3);





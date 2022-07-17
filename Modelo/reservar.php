<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=reservalibros; charset=utf8", 'root', '');
        if(!$conn){
            echo "error al conectarse";
        } else {
            echo "conectado a la base de datos";
        }
		if(!empty($_POST)){
            $isbn = $_POST['isbn'];
            $fechaReserva = $_POST['fecha'];
            $renovacion = $_POST['renovacion'];
            $estado = $_POST['Estado_nombre'];
            $cedula = $_POST['Persona_cedula'];            
            $ubicacion = $_POST['Libro_ubicacion'];
            
		}
			$sql="UPDATE reserva SET  isbn='$isbn', fechaReserva='$fecha',
            renovacion='$renovacion', estado='$Estado_nombre', cedula='$Persona_cedula', ubicacion='$Libro_ubicacion' WHERE isbn=$isbn";
		
        $stm = $conn->prepare($sql);
        $stm->execute();
        $resultSet = $stm->fetchAll(PDO::FETCH_ASSOC);
        if($stm->rowCount()==1){
            echo "ok";
        }else{
            echo "error";
        }
    }catch(PDOException $e){
        echo "error".$e->getMessage();
    }
?>
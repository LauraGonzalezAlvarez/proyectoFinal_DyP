<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=reservalibros; charset=utf8", 'root', '');

		print_r($_POST);
        if(!empty($_POST)){
            $isbn = $_POST['isbn'];
            $fecha = $_POST['fecha'];
            $renovacion = $_POST['renovacion'];
            $Estado_nombre = $_POST['Estado_nombre'];         
            $Persona_cedula = $_POST['Persona_cedula'];
            $Libro_ubicacion = $_POST['Libro_ubicacion'];
         }    
            
		
			$sql="INSERT INTO reserva VALUES('$isbn','$fecha',
			'$renovacion', '$Estado_nombre', '$Persona_cedula', '$Libro_ubicacion')";
		
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
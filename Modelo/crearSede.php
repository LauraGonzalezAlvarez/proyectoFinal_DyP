<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=reservalibros; charset=utf8", 'root', '');

		print_r($_POST);
        if(!empty($_POST)){
            $idSede = $_POST['idSede'];
            $nombre = $_POST['nombre'];
            
        }    
            
		
			$sql="INSERT INTO sede VALUES('$idSede','$nombre')";
		
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

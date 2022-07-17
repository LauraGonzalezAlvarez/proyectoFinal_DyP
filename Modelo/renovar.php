<?php
    $conn=NULL;
    try{
        $conn = new PDO("mysql:host=localhost; dbname=reservalibros; charset=utf8", 'root', '');
		if(!empty($_POST)){
            $isbn = $_POST['isbn'];
            $fecha = $_POST['fecha'];
           
		}
			$sql="UPDATE reserva SET  isbn='$isbn', fecha='$fecha' WHERE isbn=$isbn";
		
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
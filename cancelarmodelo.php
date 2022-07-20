<?php
    $conn=NULL;
    try{
        

        // Connect to DB
         $conn = new PDO("mysql://b375f2b0e09217:c9cbe69b@us-cdbr-east-06.cleardb.net/heroku_b8e35bcf3ccb2d6?reconnect=true; dbname=heroku_b8e35bcf3ccb2d6; charset=utf8", 'b375f2b0e09217', 'c9cbe69b');

        echo "funciona"
        
		if(!empty($_POST)){
            $isbn = $_POST['isbn'];
         
            $Estado_nombre = $_POST['Estado_nombre'];
            
           
		}
			$sql="UPDATE reserva SET  isbn='$isbn', Estado_nombre='$Estado_nombre' WHERE isbn=$isbn";
		
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
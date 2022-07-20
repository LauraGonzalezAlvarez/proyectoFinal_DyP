<?php
    $conn=NULL;
    try{
        //Get Heroku ClearDB connection information
        $cleardb_url = parse_url(getenv("CLEARDB_DATABASE_URL"));
        $cleardb_server = $cleardb_url["host"];
        $cleardb_username = $cleardb_url["user"];
        $cleardb_password = $cleardb_url["pass"];
        $cleardb_db = substr($cleardb_url["path"],1);
        $active_group = 'default';
        $query_builder = TRUE;

        // Connect to DB
        $conn = mysqli_connect($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db);

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
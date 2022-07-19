<?php
//Get Heroku ClearDB connection information
$cleardb_url = parse_url(getenv('mysql://b375f2b0e09217:c9cbe69b@us-cdbr-east-06.cleardb.net/heroku_b8e35bcf3ccb2d6?reconnect=true'));
$cleardb_server = $cleardb_url['us-cdbr-east-06.cleardb.net'];
$cleardb_username = $cleardb_url['b375f2b0e09217'];
$cleardb_password = $cleardb_url['c9cbe69b'];
$cleardb_db = substr($cleardb_url['path'],1);
$active_group = 'default';
$query_builder = TRUE;
// Connect to DB
$conn = mysqli_connect($cleardb_server, $cleardb_username, $cleardb_password, $cleardb_db);
echo "error";
?>
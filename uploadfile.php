<?php
 if($_SERVER['REQUEST_METHOD']=='POST'){
  	// echo $_SERVER["DOCUMENT_ROOT"];  // /home1/demonuts/public_html
	//including the database connection file
  	include_once("con.php");
    global $connect;

  	//$_FILES['image']['name']   give original name from parameter where 'image' == parametername eg. city.jpg
  	//$_FILES['image']['tmp_name']  temporary system generated name

        $originalImgName= $_FILES['filename']['name'];
        $tempName= $_FILES['filename']['tmp_name'];
        $folder="img_photo/";
        $url = "http://192.168.43.88/gisel/img_photo/".$originalImgName; //update path as per your directory structure

        if(move_uploaded_file($tempName,$folder.$originalImgName)){
                $query = "INSERT INTO upload_image (pathToFile) VALUES ('$url')";
                if(mysqli_query($connect,$query)){

                	 $query= "SELECT * FROM upload_image WHERE pathToFile='$url'";
	                 $result= mysqli_query($connect, $query);
	                 $emparray = array();
	                     if(mysqli_num_rows($result) > 0){
	                     while ($row = mysqli_fetch_assoc($result)) {
                                     $emparray[] = $row;
                                   }
                                   echo json_encode(array( "status" => "true","message" => "Successfully file added!" , "data" => $emparray) );

	                     }else{
	                     		echo json_encode(array( "status" => "false","message" => "Failed 1!") );
	                     }
                }else{
                	echo json_encode(array( "status" => "false","message" => "Failed 2!") );
                }
                mysqli_close($connect);
        }else{
        	echo json_encode(array( "status" => "false", "message" => "Failed 3!"));
        }
  }


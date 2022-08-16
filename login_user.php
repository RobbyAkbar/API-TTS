<?php
/**
 * Created by PhpStorm.
 * User: robby
 * Date: 10/03/19
 * Time: 17:22
 */

if($_SERVER['REQUEST_METHOD']=='POST'){
    require_once('connect.php');
    $password = $_POST['password'];
    $username = $_POST['username'];
    $sql = "SELECT * FROM user WHERE username = :user_name";

    $statement = $conn->prepare($sql);
    $statement->execute(
        array(
            ':user_name'	=>	$username
        )
    );
    $count = $statement->rowCount();
    if($count > 0) {
        $result = $statement->fetchAll();
        foreach($result as $row) {
          if(password_verify($password, $row["password"])) {
              echo "success~".$row['id_user']."~".$row['fullname']."~".$row['img_photo'];
          } else {
              echo "wrong password";
          }
        }
    } else {
        echo "wrong username";
    }
}

//if($_SERVER['REQUEST_METHOD']=='POST'){
//    require_once('con.php');
//    $email = $_POST['email'];
//    $password = $_POST['password'];
//    $sql = "SELECT * FROM anggota WHERE email='$email' AND password='$password'";
//
//    $result = mysqli_query($connect,$sql);
//
//    if(mysqli_num_rows($result)>0){
//        $row = mysqli_fetch_assoc($result);
//        echo "success~".$row['idAnggota']."~".$row['namaAnggota']."~".$row['dtBuat'];
//    }else{
//        echo "failure";
//    }
//    mysqli_close($connect);
//}

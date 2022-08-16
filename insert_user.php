<?php
/**
 * Created by PhpStorm.
 * User: robby
 * Date: 10/03/19
 * Time: 17:18
 */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
  require 'con.php';
  createAnggota();
}

function createAnggota() {
  global $connect;
  $fullname = $_POST["fullName"];
  $username = $_POST["username"];
  $password = $_POST["password"];
  $age = $_POST["age"];
  $gender = $_POST["gender"];
  $img_photo = $_POST["img_photo"];
  $user_encrypted_password = password_hash($password, PASSWORD_DEFAULT);

  $sql = "INSERT INTO user_seq VALUES (NULL)";
  $last_id = 0;
  if (mysqli_query($connect, $sql)) {$last_id = mysqli_insert_id($connect);}
  $id_user = "u".str_pad($last_id,4,0,STR_PAD_LEFT);

  $query = "INSERT INTO user (id_user, username, fullname, password, age, gender, img_photo) VALUES ('$id_user','$username','$fullname','$user_encrypted_password','$age','$gender','$img_photo')";

  if (mysqli_query($connect, $query)) {
    createLesson($id_user);
  } else {
    if (mysqli_errno($connect)==1062) echo "duplicate";
    else echo "Error: " . $query . "<br>" . mysqli_error($connect);
  }
}

function createLesson($id_user){
    global $connect;
    $query = "INSERT INTO progressLearn(id_user, id_lesson, score) VALUES
              ('$id_user', 'l01', 0),('$id_user', 'l02', null),('$id_user', 'l03', null),('$id_user', 'l04', null),('$id_user', 'l05', null),('$id_user', 'l06', null),('$id_user', 'l07', null),
              ('$id_user', 'l08', null),('$id_user', 'l09', null),('$id_user', 'l10', null),('$id_user', 'l11', null),('$id_user', 'l12', null),('$id_user', 'l13', null),('$id_user', 'l14', null),
              ('$id_user', 'l15', null),('$id_user', 'l16', null),('$id_user', 'l17', null),('$id_user', 'l18', null),('$id_user', 'l19', null),('$id_user', 'l20', null),('$id_user', 'l21', null),
              ('$id_user', 'l22', null),('$id_user', 'l23', null),('$id_user', 'l24', null),('$id_user', 'l25', null),('$id_user', 'l26', null),('$id_user', 'l27', null),('$id_user', 'l28', null)";
    if (mysqli_query($connect, $query)) {
        echo "success";
    } else {
        echo "Error: " . $query . "<br>" . mysqli_error($connect);
    }
}

mysqli_close($connect);

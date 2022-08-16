<?php
/**
 * Created by PhpStorm.
 * User: robby
 * Date: 28/06/19
 * Time: 15:55
 */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require 'con.php';
    listLead();
}

function listLead() {
    global $connect;
    $id_user = $_POST["id_user"];
    $query = "SELECT user.id_user, user.fullname, SUM(progressLearn.score) AS score, user.img_photo FROM progressLearn INNER JOIN user ON progressLearn.id_user = user.id_user GROUP BY user.id_user LIMIT 10";
    $result = mysqli_query($connect,$query);

    if(mysqli_num_rows($result)>0){
        $arr = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $temp = array("full_name" => $row["fullname"], "score" => $row["score"], "img_photo" => $row["img_photo"]);
            $arr[] = $temp;
        }
        $data = json_encode($arr);
        echo "$data";
    } else {
        echo "failure";
    }

    mysqli_close($connect);
}

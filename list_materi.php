<?php
/**
 * Created by PhpStorm.
 * User: robby
 * Date: 28/06/19
 * Time: 15:55
 */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require 'con.php';
    listMateri();
}

function listMateri() {
    global $connect;
    $id_user = $_POST["id_user"];
    $query = "SELECT lesson.id_lesson, lesson.lesson_name, lesson.content, lesson.url_video,
          lesson.level, lesson.icon, progressLearn.dt_finish, progressLearn.score
          FROM lesson INNER JOIN progressLearn ON lesson.id_lesson = progressLearn.id_lesson
          WHERE progressLearn.id_user = '$id_user'";
    $result = mysqli_query($connect,$query);

    if(mysqli_num_rows($result)>0){
        $arr = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $temp = array(
              "id_lesson" => $row["id_lesson"], "lesson_name" => $row["lesson_name"],
              "icon" => $row["icon"], "level" => $row["level"],
              "content" => $row["content"], "url_video" => $row["url_video"],
              "dt_finish" => $row["dt_finish"], "score" => $row["score"]);
            $arr[] = $temp;
        }
        $data = json_encode($arr);
        echo "$data";
    } else {
        echo "failure";
    }

    mysqli_close($connect);
}

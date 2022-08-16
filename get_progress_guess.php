<?php
/**
 * Created by PhpStorm.
 * User: robby
 * Date: 28/06/19
 * Time: 22:12
 */
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    require 'con.php';
    getProgGuess();
}

function getProgGuess() {
    global $connect;
    $id_user = $_POST["id_user"];
    $level = $_POST["level"];
    $query = "SELECT COUNT(progressGuess.id_user) total_guess,
            SUM(CASE WHEN progressGuess.type_answer = 'true' THEN 1 ELSE 0 END) amount_true,
            SUM(CASE WHEN progressGuess.type_answer = 'false' THEN 1 ELSE 0 END) amount_false,
            SUM(CASE WHEN progressGuess.type_answer = 'error' THEN 1 ELSE 0 END) amount_error,
            SUM(CASE WHEN progressGuess.type_answer = 'wrong' THEN 1 ELSE 0 END) amount_wrong,
            lesson.level FROM progressGuess
            RIGHT JOIN user ON progressGuess.id_user = user.id_user
            INNER JOIN guess ON progressGuess.id_guess = guess.id_guess
            INNER JOIN lesson ON guess.id_lesson = lesson.id_lesson
            WHERE user.id_user = '$id_user' AND lesson.level = '$level' GROUP BY progressGuess.id_user";
    $result = mysqli_query($connect,$query);

    if(mysqli_num_rows($result)>0){
        $arr = array();
        while ($row = mysqli_fetch_assoc($result)) {
            $temp = array("total_guess" => $row["total_guess"], "amount_true" => $row["amount_true"], "amount_false" => $row["amount_false"], "amount_error" => $row["amount_error"], "amount_wrong" => $row["amount_wrong"], "level" => $row["level"]);
            $arr[] = $temp;
        }
        $data = json_encode($arr);
        echo "$data";
    } else {
        echo "failure";
    }

    mysqli_close($connect);
}

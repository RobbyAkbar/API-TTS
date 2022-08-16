<?php
/**
 * Created by PhpStorm.
 * User: robby
 * Date: 10/03/19
 * Time: 17:16
 */

const hostname = 'localhost';
const user = 'root';
const password = '9zxnyc5e';
const databaseName = 'tts';

$connect = mysqli_connect(hostname, user, password, databaseName) or die('Unable to Connect');

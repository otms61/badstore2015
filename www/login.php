<?php
session_start();
require_once ('../config.php');

$hashed_password = md5($_GET['password']);

try {
    $dbh = new PDO(DSN, DBUSER, DBPASSWORD);
}
catch(PDOException $e) {
    print ('Error:' . $e->getMessage());
    die();
}

// fullnameのところに機密情報がのるようにこんな感じで攻撃する。
// $sql = "SELECT * FROM users WHERE email = 'a@a' and '1'='2' union select 1,1,1,1 ;-- AND password = '0cc175b9c0f1b6a831c399e269772661'";
$sql = "SELECT * FROM users WHERE email = '" . $_GET['email'] . "' AND password = '" . $hashed_password . "'";
$stmt = $dbh->query($sql);
$result = $stmt->fetch(PDO::FETCH_ASSOC);
if ($result) {
    $_SESSION['user'] = $result;
    header("Location: ./index.php");
    exit();
} else {
    $_SESSION['loginregister_error'] = '<font size="5" color="#ff0000"><b>*login faild</b></font>';
    header("Location: ./login_register.php");
    exit();
}

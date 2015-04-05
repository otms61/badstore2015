<?php
session_start();
require_once ('../config.php');

$_SESSION['cartitems'] = array();
if (!isset($_POST['cartitems'])) {
    header("Location: ./new_items.php?isNew=Y");
    exit();
} else {
    $_SESSION['cartitems'] = $_POST['cartitems'];
    header("Location: ./index.php");
    exit();
}


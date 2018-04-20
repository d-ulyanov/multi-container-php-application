<?php

session_start();

echo json_encode([
    'date' => date('r'),
    'ip' => $_SERVER['REMOTE_ADDR'],
]);

if (!array_key_exists('count', $_SESSION)) {
    $_SESSION['count'] = 0;
}

$_SESSION['count']++;

echo $_SESSION['count'];

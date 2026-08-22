<?php
require_once "../restaurante.php";

$result = $saborotage->query("select * from garcons");
$garcons = [];
while ($garcom = $result->fetch_assoc())
    $garcons[] = $garcom;

header('Content-Type: application/json; charset=utf-8');
echo json_encode($garcons);
?>
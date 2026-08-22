<?php
require_once "../restaurante.php";
header('Content-Type: application/json; charset=utf-8');

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $json = file_get_contents("php://input");
    $evento = json_decode($json, true);

    $tipo = $evento["tipo"];

    if ($tipo === "comprar") {
        // $idGarcom = $evento["idGarcom"];
        // $idMesa = $evento["idMesa"];
        $idPrato = $evento["idPrato"];

        $saborotage->query("update pratos set vendidos = vendidos + 1, dinheiroGanho = dinheiroGanho + preco where id = $idPrato");
        $prato = $saborotage->query("select * from pratos where id = $idPrato;")->fetch_assoc();

        $json = json_encode($prato);

        $arquivo = fopen("../eventos.txt", "a");
        fwrite($arquivo, $json . PHP_EOL);
        fclose($arquivo);

        echo "sucesso";
    }

}
else {
    $result = $saborotage->query("select * from pratos where imagem <> '';");
    $pratos = [];
    while ($prato = $result->fetch_assoc())
        $pratos[] = $prato;
        
    echo json_encode($pratos);
}
?>
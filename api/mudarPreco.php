<?php
require_once "restaurante.php";

header("content-Type: text/event-stream");
header("cache-Control: no-cache");
header("connection: keep-alive");

file_put_contents("eventos.txt", "");
$posicao = filesize("eventos.txt");

while(true){
    clearstatcache(true, "eventos.txt");
    $arquivo = fopen("eventos.txt", "r");

    fseek($arquivo, $posicao);

    if(($linha = fgets($arquivo)) !== false){
        echo "data: ". $linha. "\n\n";

        ob_flush();
        flush();
        $posicao = ftell($arquivo);
    }

    fclose($arquivo);
    sleep(0.20);
}

?>
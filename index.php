<?php 

require "tool.php";

$tool = new Tools();
$tool->insert("Martillo",2);
$tool->search(1);
$tool->search(2,COLUMNS[2]."=1");
$tool->search(3,false,COLUMNS[0],COLUMNS[2]);
$tool->search(4,COLUMNS[2]."=1",COLUMNS[0]);





?>